class User < ApplicationRecord

  # 親であるユーザーが削除されると、その投稿も削除される、という意味らしい
  has_many :posts, dependent: :destroy

  has_many :comments

  validates :email, :username, :profile, presence: true
  validates :profile, length: { maximum: 250 }

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
