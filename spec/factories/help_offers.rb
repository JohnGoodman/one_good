# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :help_offer do
    user nil
    receiving_user_id "MyString"
    status "MyString"
    decline_message "MyText"
    accept_message "MyText"
  end
end
