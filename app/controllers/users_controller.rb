class UsersController < ApplicationController
  before_action :authenticate_user!, :fetch_company

  def index
    @users = @company.users.all
  end
  private
  
  def fetch_company 
    @company = Company.find(params[:company_id])
  end

end
