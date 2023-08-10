class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :change_requests, dependent: :destroy
  has_many :children,  dependent: :destroy
  has_many :parks,  dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :account_name, presence: true, length: { maximum: 20 }
  validates :email,        presence: true, uniqueness: true
  validates :password,     presence: true



end
