class List < ApplicationRecord
  attachment :image

  # バリデーションの設定
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
