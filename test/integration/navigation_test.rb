require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest

  test "verify_verify_email" do
    assert_routing "/emails", { :controller => "verify_emails", :action => "index" }

    hash_key = '12345678901234567890123456789012'
    assert_routing "/emails/verify_emails/verify/#{hash_key}", { :controller => "verify_emails", :action => "verify", :hash_key => hash_key }
  end

end

