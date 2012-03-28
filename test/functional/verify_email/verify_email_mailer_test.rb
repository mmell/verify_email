require 'test_helper'

module VerifyEmail
  class VerifyEmailMailerTest < ActionMailer::TestCase
    test "verify_email" do
      to = "to@example.org"
      opts = { from: ::VerifyEmail::From, verify_email: FactoryGirl.create(:verify_email) }
      mail = VerifyEmailMailer.verify_email(to, opts)
      assert_equal "Email Verification", mail.subject
      assert_equal [to], mail.to
      assert_equal [::VerifyEmail::From], mail.from
      assert_match "Click the link below to verify your email address", mail.body.encoded
    end

  end
end
