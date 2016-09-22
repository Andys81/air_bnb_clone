class Listing < ActiveRecord::Base

	validates :avatars, presence: true

	belongs_to :user
	has_many :listing_tags
	has_many :tags, through: :listing_tags
	has_many :reservations, :dependent => :destroy

	mount_uploaders :avatars, AvatarUploader

end
