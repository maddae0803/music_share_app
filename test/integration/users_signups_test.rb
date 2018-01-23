require 'test_helper'

class UsersSignupsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "invalid signups" do
    get signup_path
    assert_no_difference 'User.count' do
    post users_path, params: { user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar", user_type: ""} }
    end
#assert_template 'users/new'
  end

  test "valid signups" do
      get signup_path
      assert_difference 'User.count', 1 do
          post users_path, params: { user: { name: "ExampleUser", email: "user@valid.com", password: "validpass", password_confirmation: "validpass", user_type: "Listener" } }
          end
      end
end
