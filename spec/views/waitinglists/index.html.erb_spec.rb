require 'rails_helper'

RSpec.describe "waitinglists/index", type: :view do
  before(:each) do
    assign(:waitinglists, [
      Waitinglist.create!(
        user: nil,
        library: nil
      ),
      Waitinglist.create!(
        user: nil,
        library: nil
      )
    ])
  end

  it "renders a list of waitinglists" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
