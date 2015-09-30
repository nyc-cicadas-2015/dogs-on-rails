class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: session_params[:username])
    if user.try(:authenticate, session_params[:password])
      flash[:message] = "Welcome #{user.username}!!"
      session[:user_id] = user.id
    else
      flash[:error] = 'Incorrect username or password'
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    flash[:message] = 'So Long, and Thanks for all the Fish!'
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
