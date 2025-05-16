class PrototypesController < ApplicationController
before_action :set_prototype, only: [:show, :edit, :update, :destroy]
before_action :move_to_index, only: [:edit, :update,]
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?


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
      @comment = Comment.new #これだと @comment には「コメントの一覧（Relation）」が入ってしまいます。→ form_with では「空の1件のモデル」が欲しいので、Comment.new に直す必要があります。
      @comments = @prototype.comments.includes(:user)

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
    comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{comment.tweet.id}"  # コメントと結びつくツイートの詳細画面に遷移する

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
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name , :profile, :occupation, :position])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name , :profile, :occupation, :position])
  end


  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

   def move_to_index
   unless current_user == @prototype.user
     redirect_to root_path
   end 
 end
end