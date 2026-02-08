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
      user = User.find_or_create_by!(email: auth.info.email)

      user.authentications.create!(
        provider: auth.provider,
        uid: auth.uid,
        name: auth.info.name
      )
    end

    session[:user_id] = user.id
    redirect_to users_path, notice: "ログインしました。"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
