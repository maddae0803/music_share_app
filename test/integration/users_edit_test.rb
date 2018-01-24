require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
      @user = users(:max)
  end
 
=begin 
  test "Successful Edits" do
    log_in_as(@user)
    get edit_user_path(@user)
    #assert_template 'users/edit'
    
    new_name = "Maxwell"
    new_email = "newemail@gmail.com"
    
    patch user_path(@user), params: { user: { name: new_name, email: new_email, password: "", password_confirmation: "", user_type: "Listener" } }
    
   assert_not flash.empty?
   assert_redirected_to @user
   
   @user.reload
   
   assert_equal new_name, @user.name
   assert_equal new_email, @user.email
  
  end
=end

      
end
