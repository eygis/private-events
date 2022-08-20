class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :events, class_name: 'Event', foreign_key: 'user_id'
end
