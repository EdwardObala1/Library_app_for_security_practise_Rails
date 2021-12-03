require 'rails_helper'

RSpec.describe "waitinglists/new", type: :view do
  before(:each) do
    assign(:waitinglist, Waitinglist.new(
      user: nil,
      library: nil
    ))
  end

  it "renders new waitinglist form" do
    render

    assert_select "form[action=?][method=?]", waitinglists_path, "post" do

      assert_select "input[name=?]", "waitinglist[user_id]"

      assert_select "input[name=?]", "waitinglist[library_id]"
    end
  end
end
