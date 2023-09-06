class User < ApplicationRecord
  has_many :reviews
  has_many :suggestions, through: :reviews

  has_many :favorites
  has_many :suggestions, through: :favorites
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
