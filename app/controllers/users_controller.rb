class UsersController < ApplicationController
  before_action :compare_user, only: [:edit]
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを編集しました！"
    else
      render :edit
      binding.pry
    end
  end

  def show
  end

private
def user_params
  params.require(:user).permit(:name, :email, :profile, :profile_text, :password,
                               :password_confirmation)
end

def set_user
  @user = User.find(params[:id])
end

def compare_user
  if current_user.id != params[:id].to_i
    flash[:notice]="権限がありません"
    redirect_to user_path(params[:id])
  end
end
end
