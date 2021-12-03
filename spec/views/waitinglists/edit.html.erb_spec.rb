require 'rails_helper'

RSpec.describe "waitinglists/edit", type: :view do
  before(:each) do
    @waitinglist = assign(:waitinglist, Waitinglist.create!(
      user: nil,
      library: nil
    ))
  end

  it "renders the edit waitinglist form" do
    render

    assert_select "form[action=?][method=?]", waitinglist_path(@waitinglist), "post" do

      assert_select "input[name=?]", "waitinglist[user_id]"

      assert_select "input[name=?]", "waitinglist[library_id]"
    end
  end
end
