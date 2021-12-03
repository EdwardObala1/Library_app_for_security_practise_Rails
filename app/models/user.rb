class User < ApplicationRecord
    validates :name, :email, :password, :access, presence: true
    attribute :name, default: ''
    attribute :email, default: ''
    attribute :access, default: 'basic'
    has_many :libraries
end
