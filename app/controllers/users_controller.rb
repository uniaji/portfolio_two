class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:id, :username, :email, :image, :profile)
    end

end
