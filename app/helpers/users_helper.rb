module UsersHelper
	# Returns the Gravatar for the given user.

  def profile_pic_for (user)
    if user.picture.url.nil?
      image_tag("blank_profile.png", class: "profile")
    else
      image_tag(user.picture.url, class: "profile")
    end
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def options_for(user)
  	options = ["Songwriter/Artist", "Listener"]
  	if user.user_type && user.user_type == "Listener"
  		options.reverse!
  	end
  		return options
  end
end
