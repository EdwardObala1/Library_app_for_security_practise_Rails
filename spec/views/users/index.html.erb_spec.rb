require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        name: "MyText",
        email: "MyText",
        password: "Password",
        access: "Access",
        role: "MyText"
      ),
      User.create!(
        name: "MyText",
        email: "MyText",
        password: "Password",
        access: "Access",
        role: "MyText"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
    assert_select "tr>td", text: "Access".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
