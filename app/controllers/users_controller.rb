class UsersController < ApplicationController
  before_action :require_login, only: %i[show]

  def show
    @user = current_user
    @current_authentication = @user.authentications.find_by(id: session[:authentication_id])
  end
end
