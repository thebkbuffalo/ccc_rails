class Admin::BaseController < ApplicationController
  before_action :restrict_user_by_role

  protected

  # redirect if user not logged in or does not have a valid role
  def restrict_user_by_role
    unless current_user
      flash[:notice] = 'GET THE FUCK OUTTA HERE'
      redirect_to root_path # change this to your 404 page if needed
    end
  end

end
