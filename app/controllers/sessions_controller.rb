class SessionsController < ApplicationController
  #login
  def create
  	
  	user = User.where(email: params[:email]).first

  	session[:current_user_id] = user.id

  	redirect_to users_url

  end

  #logout
  def destroy
  	session[:current_user_id] = nil
  	redirect_to :new_session_url
  end

  #form 
  def new 
  end
end
