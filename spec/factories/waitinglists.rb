FactoryBot.define do
  factory :waitinglist do
    user_id {user}
    libraries_id {library}
  end
end
