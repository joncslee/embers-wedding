# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    zipcode "MyString"
    last_name "MyString"
    comments "MyText"
    hotel false
  end
end
