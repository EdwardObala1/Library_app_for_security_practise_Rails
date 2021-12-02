require 'rails_helper'

RSpec.describe "Libraries", type: :request do
  describe "GET /libraries" do
    it "works! (now write some real specs)" do
      get libraries_path
      expect(response).to have_http_status(200)
    end
  end


  describe 'all basic Library functionalities' do
    let(:library){create(:library)}
    it 'adds a book and redirects to another page' do
      post add_book_path, :params => {library: {book_title: library.book_title, author: library.author, publish_year: library.publish_year}}
      expect(response.status).to eq(302)
    end

    it 'can delete a book' do
      delete library_delete_path(library.id)
      expect(response.status).to eq(302)
    end

    it 'can edit a book' do
      patch update_path(library.id), :params => {library: {book_title: 'New title', author: 'Edward.O.O', publish_year: 2000}}
      expect(response.status).to eq(302)
    end
  end

  describe 'User based functionality' do
    it 'only users that are admins can manipulate books'
    it 'Librarians and admins can assign books as lent out'
    it 'every user can see if a book is lent out or not'
  end
end
