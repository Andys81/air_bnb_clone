class ListingsController < ApplicationController

  before_action :find_listing, only: [:show, :edit, :destroy]

  def index
  	@listings = Listing.all # index function
  end

  def show
  	
  end

  def new
  	@listing = Listing.new
  end	

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
       redirect_to root_url
    else 
      render :new
    end 
  end

  def destroy

	end

  def find_listing
    @listing = Listing.find(params[:id]) 
  end 

  private
  def listing_params
    params.require(:listing).permit(:name, :description, :address, :country, :city, :price, :user_id)
  end 

end



# get '/listing/:id' do
# 	erb :"listings/index.html.erb"
# end
