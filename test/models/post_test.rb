require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = users(:max)
  	#@post = @user.posts.build(song_title: "Novacane", song_artist: "Frank Ocean", song_comments: "")
  end

=begin
  test "post should be valid" do
  	assert @post.valid?
  end

  test "user id should be present" do
  	@post.user_id = nil
  	assert_not @post.valid?
  end

  test "posts should be invalid when there is no title or artist name" do
  	@post.song_title = "";
  	assert_not @post.valid? 
  	@post.song_title = "My Song"
  	@post.song_artist = ""
  	assert_not @post.valid? 
  end

  test "song titles should not be longer than 70 characters" do
  	@post.song_title = "Song" * 20;
  	assert_not @post.valid?
  end

  test "artist names should not be longer than 50 characters" do
  	@post.song_artist = "Artist" * 10;
  	assert_not @post.valid? 
  end
=end
  test "order should be most recent first" do
  	assert_equal posts(:most_recent), Post.first
  end
end
