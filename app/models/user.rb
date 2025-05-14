class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 # Sampleモデルにおいて、「a、bそれぞれのカラムが空では保存できない」というバリデーションを設定する場合
 validates :email, presence: true
 validates :password, presence: true

end