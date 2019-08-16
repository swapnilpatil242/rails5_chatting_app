class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user.present?
      flash[:success] = "User is in..!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:notice] = "Invalid user"
      session[:user_id] = nil
      render "new"
    end
  end

end
