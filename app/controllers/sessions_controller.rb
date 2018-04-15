class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if !@user.nil? && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def delete
    reset_session
    redirect_to '/'
  end
end
