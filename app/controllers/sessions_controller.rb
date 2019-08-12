class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user 
      current_user = @user
      flash[:success] = 'Logged in!'
      redirect_to posts_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end 

  def destroy
    log_out
    redirect_back(fallback_location: posts_url) 
  end 
end
