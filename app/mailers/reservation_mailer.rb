class ReservationMailer < ApplicationMailer

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

end
