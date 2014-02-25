class WelcomeController < ApplicationController
  def index
  	@welcomes = Welcome.all
  end
end
