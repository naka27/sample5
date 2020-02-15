class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/
  validates :password, presence: true, format: {with: VALID_PASSWORD_REGEX}

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  
  validates :name, presence: true, length: { maximum: 15}

  has_secure_password
  
  has_many :topics
  
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end