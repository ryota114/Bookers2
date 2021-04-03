class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment:profile_image

  # nameカラムには一意性、２〜２０文字の制限を設ける
  validates :name, uniqueness: true, length: { in: 2..20 }
  # introductionは、文字数最大５０文字
  validates :introduction, length: { maximum: 50 }
end
