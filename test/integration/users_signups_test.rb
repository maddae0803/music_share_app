require 'test_helper'

class UsersSignupsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signups" do
    get signup_path
    assert_no_difference 'User.count' do
    post users_path, params: { user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar", user_type: ""} }
    end
    assert_template 'users/new'
  end

  test "valid signups with activation" do
      get signup_path
      assert_difference 'User.count', 1 do
          post users_path, params: { user: { name: "ExampleUser", email: "user@valid.com", password: "validpass", password_confirmation: "validpass", user_type: "Listener" } }
          end
          assert_equal 1, ActionMailer::Base.deliveries.size
      user = assigns(:user)
      assert_not user.activated?
    # Try to log in before activation.
     log_in_as(user)
      assert_not is_logged_in?
    # Invalid activation token
      get edit_account_activation_path("invalid token", email: user.email)
      assert_not is_logged_in?
    # Valid token, wrong email
      get edit_account_activation_path(user.activation_token, email: 'wrong')
      assert_not is_logged_in?
    # Valid activation token
      get edit_account_activation_path(user.activation_token, email: user.email)
      assert user.reload.activated?
          follow_redirect!
          assert_template 'users/show'
          assert is_logged_in?
      end


end
