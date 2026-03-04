FactoryBot.define do
  factory :board do
    title { "MyString" }
    body { "MyText" }
    association :user
  end
end