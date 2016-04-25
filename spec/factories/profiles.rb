FactoryGirl.define do
  factory :profile do
    first_name "MyString"
    last_name "MyString"
    school "MyString"
    role "MyString"
    grade "MyString"
    mailing_list false
    association :user, factory: :user
  end
end
