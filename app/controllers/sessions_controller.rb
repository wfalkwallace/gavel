class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  #login
  def create
  	
  	user = User.where(email: params[:email]).first
  	
    if user
      session[:current_user_id] = user.id

    	redirect_to users_url
    else
      redirect_to signup
    end

  end

  #logout
  def destroy
  	session[:current_user_id] = nil
  	redirect_to :new_session
  end

  #form 
  def new 
  end
end
