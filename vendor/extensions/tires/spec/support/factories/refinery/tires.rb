
FactoryGirl.define do
  factory :tire, :class => Refinery::Tires::Tire do
    sequence(:category) { |n| "refinery#{n}" }
  end
end

