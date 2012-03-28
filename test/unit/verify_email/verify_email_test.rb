require 'test_helper'

module VerifyEmail
  class VerifyEmailTest < ActiveSupport::TestCase

    test "sets the defaults" do
      verify_email = FactoryGirl.create(:verify_email)
      assert verify_email.valid?
      assert verify_email.email =~ /@example.com/
      assert verify_email.continue_to =~ /http:/

    end

  end
end
