FactoryBot.define do
  factory :user do
    name { "Edward" }
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password { "password1234" }
    access { "basic" }
    role { "student" }
    admin {false}
    librarian {false}
  end
end
