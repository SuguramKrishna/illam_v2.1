class HomesController < ApplicationController
  skip_before_action :ensure_user_logged_in
  
  def index

  end

  def search_prop
    @search_prop = Property.where('address Like ?', "%" + params[:query] + "%")
  end

  

end
