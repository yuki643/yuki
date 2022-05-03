class HotelsController < ApplicationController
  
  def top_page
   @user = current_user
  end
end
