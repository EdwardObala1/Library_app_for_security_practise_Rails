require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){create(:user)}
  it 'confirms an entry with values is valid' do
    user = User.create(name: 'Edward', email: "edward@gmail.com", password: "12e2hofn", 
      access: 'basic',
      role: 'student'
    )
    expect(user).to be_valid
  end

  it 'confirms an entry without values is not valid' do
    user = User.create(name: '', email: "", password: "", 
      access: 'basic',
      role: 'student'
    )
    expect(user).to_not be_valid
  end
end
