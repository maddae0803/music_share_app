require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password", user_type: "Artist")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "  ";
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "  ";
  	assert_not @user.valid?
  end

  test "Name should not be longer than 50 characters" do
  	@user.name = 'a' * 52; 
  	assert_not @user.valid? 
  end 

  test "Email should not be longer than 255 characters" do
  	@user.email = 'a' * 244 + "@example.com"; 
  	assert_not @user.valid? 
  end 

  test "Valid Emails Should Be Accepted" do
  	 valid_addresses = %w[user@example.com user@example.edu user@gmail.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "Invalid Emails Should Not Be Accepted" do
  	invalid_addresses = %w[user@example,com user@example this.is.not@valid.]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "Emails Should Be Unique" do
  	other_user = @user.dup
  	other_user.name = "Max"
  	other_user.email = @user.email.upcase
  	@user.save
  	assert_not other_user.valid?
  end

  test "Password Should Not Be Blank" do
  	@user.password = @user.password_confirmation = ' ' * 9;
  	assert_not @user.valid?
  end

  test "Password Should Be At Least 6 Characters Long" do
  	@user.password = @user.password_confirmation = 'b' * 4;
  	assert_not @user.valid? 
  end

  test "User Must Have a Type" do
    @user.user_type = " ";
    assert_not @user.valid?
  end
end
