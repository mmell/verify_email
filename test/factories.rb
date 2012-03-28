FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :verify_email, :class => VerifyEmail::VerifyEmail do
    email
    continue_to 'http://example.com/continue'
  end

end
