class SessionController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:role] = user.role
      respond_to do |format|
        format.html { redirect_to tours_url, notice: 'Logged in successfully.' }
       end
      #redirect_to tour_url, alert "Logged in successfully"
    else
      respond_to do |format|
        format.html { redirect_to login_url, notice: 'Did not Log in successfully.' }
      end
      #redirect_to login_url, alert "Unsuccessful login!"
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to login_url, notice: 'Logged out successfully.' }
    end
    #redirect_to login_url, alert:"Successfully Logged Out."
  end
end
