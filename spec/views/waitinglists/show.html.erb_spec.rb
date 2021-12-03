require 'rails_helper'

RSpec.describe "waitinglists/show", type: :view do
  before(:each) do
    @waitinglist = assign(:waitinglist, Waitinglist.create!(
      user: nil,
      library: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
