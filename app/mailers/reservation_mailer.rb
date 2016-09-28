class ReservationMailer < ApplicationMailer

  def confirmation_email(user, listing, reservation)
    
    @reservation = reservation
    @listing = listing
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

end
