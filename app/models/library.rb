class Library < ApplicationRecord
    validates :book_title, :author, presence: true
end
