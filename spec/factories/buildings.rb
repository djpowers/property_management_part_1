FactoryGirl.define do
  factory :building do
    address '1102 Main Street'
    city 'Hanover'
    state 'MA'
    postal_code '02339'
    description 'multi-family home'

    factory :building_with_owner do
      owner
    end
  end
end
