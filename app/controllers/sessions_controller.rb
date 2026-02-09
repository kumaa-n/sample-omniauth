class SessionsController < ApplicationController
  def new
    redirect_to users_path if logged_in?
  end

  def omniauth_callback
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_by(provider: auth.provider, uid: auth.uid)

    if authentication
      user = authentication.user
    else
      begin
        ActiveRecord::Base.transaction do
          user = User.find_or_create_by!(email: auth.info.email)
          user.authentications.create!(
            provider: auth.provider,
            uid: auth.uid,
            name: auth.info.name
          )
        end
      rescue ActiveRecord::RecordInvalid => e
        redirect_to root_path, alert: "ログインに失敗しました。"
        return
      end
    end

    reset_session
    session[:user_id] = user.id
    session[:authentication_id] = authentication&.id || user.authentications.find_by(provider: auth.provider, uid: auth.uid)&.id
    redirect_to users_path, notice: "ログインしました。"
  end

  def omniauth_failure
    redirect_to root_path, alert: "認証に失敗しました。"
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
