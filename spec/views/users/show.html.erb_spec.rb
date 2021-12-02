require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: "MyText",
      email: "MyText",
      password: "Password",
      access: "Access",
      role: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Access/)
    expect(rendered).to match(/MyText/)
  end
end
