class SessionController < ApplicationController
  def new
  end

  def create
    login = Login.find_by(name: params[:name])
    if login and login.authenticate(params[:password])
      sessions[:user_id] = login.id
      redirect_to logins_url, alert "Logged in successfully"
    else
      redirect_to logins_url, alert "Unsuccessful login!"
    end
  end

  def destroy
    session[:user_id] = Nil
    redirect_to logins_url
  end
end
