class UsersController < ApplicationController
  before_action :authenticate_user!, :fetch_company, only: [:index]
  before_action :authenticate_user!, :fetch_user, only: [:destroy]

  def index
    @users = @company.users.all
  end
  
  def edit
  end

  def destroy     
    @user.delete
    redirect_to company_users_path
  end

  private
  
  def fetch_user 
    @user = User.find(params[:id])
  end
  def fetch_company 
    @company = Company.find(params[:company_id])
  end

end
