class ReservationsController < ApplicationController
  
  before_action :find_reservation, only: [:show, :destroy]
  # before_action :check_dates, only: [:create]


	def index
		@reservation = Reservation.all
	end

	def show
	end

	def create
		byebug
		@reservation = current_user.reservations.new(reservation_params)
			if @reservation.save
       redirect_to root_url
    	else 
      	render :new
    	end 
	end

	def destroy
		@reservation.destroy
    redirect_to root_path
	end

	def find_reservation
		@reservation = Reservation.find(params[:id])
	end

	def check_dates
		@check_dates = Reservation.where(user_id :user_id, listing_id :listing_id).each do |date|

			if start_date

		end


	end

	
	private

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date, :total_price)
  end 

end
