FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'Flavor'
    last_name 'Town'
    email { generate :email }
    password "likeTheRingbutwithDonkeySauce"
    password_confirmation "likeTheRingbutwithDonkeySauce"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Action'
    last_name 'Bronson'
    email { generate :email }
    password "SuedeOnTheRoof"
    password_confirmation "SuedeOnTheRoof"
  end
end
