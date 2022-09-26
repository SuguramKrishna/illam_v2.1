class PagesController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def build_prog
    
  end
end