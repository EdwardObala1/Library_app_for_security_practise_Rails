class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name, :email, :password, :access, presence: true
    attribute :name, default: ''
    attribute :email, default: ''
    attribute :access, default: 'basic'
    has_many :libraries
end
