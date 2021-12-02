require 'rails_helper'

RSpec.describe Library, type: :model do
  it 'checks if created book with values are valid' do
    library = Library.create(book_title: 'Free World', author:'Ken Jeong', publish_year:2000)
    expect(library).to be_valid
  end

  it 'ensures book with no title is not valid' do
    library = Library.create(book_title: '', author:'Ken Jeong', publish_year:2000)
    expect(library).to_not be_valid
  end

  it 'ensures book with no author is not valid' do
    library = Library.create(book_title: 'Free World', author:'', publish_year:2000)
    expect(library).to_not be_valid
  end
end
