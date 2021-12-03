class Waitinglist < ApplicationRecord
  has_many :users
  has_many :libraries
end
