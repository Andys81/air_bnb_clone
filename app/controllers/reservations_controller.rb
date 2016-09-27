class ReservationsController < ApplicationController
  
  before_action :find_reservation, only: [:show, :destroy, :confirm_reservation]
  before_action :check_dates, only: [:create]


	def index
		@reservation = Reservation.all
	end

	def show
	end

	def create
		# respond_to do |format|		
			if @no_conflicts == true
				@reservation.save

				ReservationMailer.delay_for(10.seconds).confirmation_email(current_user) #.deliver_later
	      # format.html { redirect_to @user, notice: 'Reservation was successfully created.' }
	      # format.json { render :show, status: :created, location: @user }
	      redirect_to root_url
    	else 
      	redirect_to listing_path(params[:reservation][:listing_id])
	      # format.html { render :new }
	      # format.json { render json: @user.errors, status: :unprocessable_entity }
    	end 
    # end
	end

	def confirm_reservation
		@reservation.update(confirmed: true)
	end


	def destroy
		@reservation.destroy
    redirect_to root_path
	end

	def find_reservation
		@reservation = Reservation.find(params[:id])
	end

	def check_dates
		@no_conflicts = true			

		# price = @reservation.total_price.to_i
		# nights = (@reservation.end_date - @reservation.start_date).to_i
		# total_price = nights * price

		@reservation = current_user.reservations.new(reservation_params)					
		all_reservations = Reservation.where(listing_id: params[:reservation][:listing_id]).each do |r|
				
			if @reservation.start_date.between?(r.start_date, r.end_date) || @reservation.end_date.between?(r.start_date, r.end_date)
					@no_conflicts = false
			else
					@no_conflicts = true
			end		
		end

	end

	
	private

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date, :price, :total_price)
  end 

end
