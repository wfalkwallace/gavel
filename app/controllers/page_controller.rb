class PageController < ApplicationController

  skip_before_filter :require_user

  def about
  end

  def contact
  end
end
