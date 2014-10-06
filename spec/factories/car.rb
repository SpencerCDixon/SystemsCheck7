FactoryGirl.define do
  factory :car do
    color "red"
    year 1950
    mileage 1000

    association :manufacturer
  end
end
