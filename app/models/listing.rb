class Listing < ActiveRecord::Base

belongs_to :user
has_many :listing_tags, :dependent => :destroy

end
