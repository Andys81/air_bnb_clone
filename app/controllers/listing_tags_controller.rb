class ListingTagsController < ApplicationController

	before_action :find_listing_tag, only: [:show, :destroy]

	def index
		@listing_tag = Listing_tag.all
	end

	def show
	end

	def new
		@listing_tag = Listing_tag.new
	end

	def create
		@listing_tag = current_user.listing_tag.new(listing_tag_params)
			if @listing_tag.save
       redirect_to root_url
    	else 
      	render :new
    	end 
	end

	def destroy
		@listing_tag.destroy
    redirect_to root_path
	end

	def find_listing_tag
		@listing_tag = Listing_tag.find(params[:id])
	end

	private
  def listing_tag_params
    params.require(:listing_tag).permit(:listing_id, :tag_id)
  end 


end
