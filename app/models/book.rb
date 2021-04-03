class Book < ApplicationRecord
  belongs_to :user

  # titleは空なし
  validates :title, presence: true
  # bodyは空なし、最大２００文字
  validates :body, presence: true, length: { maximum: 200 }
end
