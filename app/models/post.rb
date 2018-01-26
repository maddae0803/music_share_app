class Post < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true
	mount_uploader :audio, AudioUploader
	default_scope -> { order(created_at: :desc) }

	validates :song_title, presence: true, length: { maximum: 70 }
	validates :song_artist, presence: true, length: { maximum: 50 }

end
