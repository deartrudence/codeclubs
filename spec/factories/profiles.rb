FactoryGirl.define do
  factory :profile do
    first_name "Amy"
    last_name "Jones"
    school "MyString"
    role "admin"
    grade "MyString"
    mailing_list true
    association :user, factory: :user
  end
end
