class UsersController < ApplicationController

  def show
  @user = User.find(params[:id])
    if @user.nil?
    redirect_to root_path, alert: "ユーザーが見つかりません"
    return
  @prototypes = @user.prototypes.includes(:user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :profile, :occupation, :position)
  end
end