FactoryBot.define do
  factory :user do
    name { "Edward" }
    email { "eddy@gmail.com" }
    password { "password1234" }
    access { "basic" }
    role { "student" }
  end
end
