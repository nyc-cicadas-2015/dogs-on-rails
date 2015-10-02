class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: session_params[:username])
    if user.try(:authenticate, session_params[:password])
      session[:user_id] = user.id

      respond_to do |fmt|
        fmt.html {
          flash[:message] = "Welcome #{user.username}!!"
          redirect_to root_path
        }
        fmt.json { render json: user.to_json(only: [:username]) }
      end

    else

      respond_to do |fmt|
        fmt.html {
          flash[:error] = 'Incorrect username or password'
          redirect_to root_path
        }
        fmt.json {
          render json: { message: 'incorrect username or password' }, status: 422
        }
      end

    end
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
