class Tag < ActiveRecord::Base

has_many :listing_tags, :dependent => :destroy

end
