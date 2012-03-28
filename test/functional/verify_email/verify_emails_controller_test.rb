require 'test_helper'

module VerifyEmail
  class VerifyEmailsControllerTest < ActionController::TestCase
    setup do
      @verify_email = FactoryGirl.create(:verify_email)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:verify_email)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create verify_email" do
      assert_difference('VerifyEmail.count') do
        post :create, verify_email: @verify_email.attributes
      end

      assert_redirected_to verify_email_path(assigns(:verify_email))
    end

    test "should show verify_email" do
      get :show, id: @verify_email
      assert_response :success
    end

    test "should update verify_email" do
      put :update, id: @verify_email, verify_email: @verify_email.attributes
      assert_redirected_to verify_email_path(assigns(:verify_email))
    end

  end
end
