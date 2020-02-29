class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user

  mount_uploader :image, ImageUploader
  
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  #topicをいいねしている全てのユーザー（id）を取得します
  has_many :deletes
  #削除機能
end