class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @users = User.all
    # 一覧ページの処理（誰でも見られる）
  end

  private

  def move_to_index
    unless prototype.user_id == current_user.id
      redirect_to action: :index
    end
  end
end