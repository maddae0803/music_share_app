require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@post = posts(:one)
  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Post.count' do
  		post posts_path, params: { post: { song_title: 'A', song_artist: 'B', song_comments: ""} }
  	end
  	assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
  	assert_no_difference 'Post.count' do
  		delete post_path(@post)
  	end
  	assert_redirected_to login_url
  end
end
