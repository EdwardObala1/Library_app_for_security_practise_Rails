class Library < ApplicationRecord
    validates :book_title, :author, presence: true
    belongs_to :user
    attribute :user_id, default: 0
end
