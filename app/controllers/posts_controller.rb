class PostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
before_action :correct_user, only: :destroy

	def create
		@post = current_user.posts.build(post_params)
		if current_user.user_type == "Songwriter/Artist"
			@post.song_artist = current_user.name
		end
		if @post.save
  			# Handle a Successful Save
  			flash[:success] = "New Song Added!"
  			redirect_to root_url
  		else
  			@feed_items = []
  			render 'static_pages/home'
  		end
	end

	def destroy
		@post.destroy
		flash[:danger] = "Song Deleted"
		redirect_to root_url
	end

	private
		def post_params
			params.require(:post).permit(:song_title, :song_artist, :song_comments, :audio)
		end

		def correct_user
			@post = current_user.posts.find_by(id: params[:id])
			redirect_to root_url if @post.nil?
		end
end
