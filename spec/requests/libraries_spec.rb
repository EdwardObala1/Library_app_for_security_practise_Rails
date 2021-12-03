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
    let(:user){create(:user)}
    it 'adds a book and redirects to another page' do
      post add_book_path, :params => {library: {book_title: library.book_title, author: library.author, publish_year: library.publish_year, user: library.user}}
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
    let(:library){create(:library)}
    let(:waitinglist){create(:waitinglist)}
    let(:user){create(:user)}
    it 'checks if users can borrow books' do
      post borrow_book_url(library.id)
      expect(response.status).to eq(302)
    end
    it 'shows the waiting list for a book' do
      get waitinglist_path(library.id)
      expect(response.status).to eq(200)
    end

    it 'adds user to waiting list for book' do
      post waitinglist_path(library.id), :params => { user_id: user.id }
      expect(response.status).to eq(200)
    end
    
    it 'Librarians and admins can assign books as lent out'

    it 'only users that are admins can manipulate books'
    it 'make sure books have a two weeks return limit'
  end
end
