FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "let's talk about Rick Ross"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "the human torch was denied a bank loan"
    user
  end
end
