FactoryGirl.define do
  factory :study do
    name 'Test Study'
    code 'AMZ'
    description 'An amazing study'
    start Time.now - 1.year
    ending Time.now + 1.year
  end
end
