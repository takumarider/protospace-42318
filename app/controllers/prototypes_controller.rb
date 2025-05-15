class PrototypesController < ApplicationController
before_action :set_prototype, only: [:show, :edit, :update, :destroy]
before_action :move_to_index, only: [:edit,]
  def index
    @users = User.all
    @prototypes = Prototype.all
  end
  
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
 
  end
  def new
    @prototype = Prototype.new
    # 新規作成ページの処理（ログインユーザーのみ）
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
    
  def edit
    @prototype = Prototype.find(params[:id])
  end


  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end
  end
end