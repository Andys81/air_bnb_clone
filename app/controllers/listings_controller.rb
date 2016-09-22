class ListingsController < ApplicationController

  before_action :find_listing, only: [:show, :edit, :destroy, :update]

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

  def edit
  end

  def update
    if @listing.update(listing_params)
      flash[:success] = 'You have updated your listing successfully!'
       redirect_to root_url
    else 
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to root_path
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
