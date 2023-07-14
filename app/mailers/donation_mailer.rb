class DonationMailer < ApplicationMailer
  default from: 'donaronlineapp@donaronline.com'

  def thanks_email
    @user = params[:user]
    @url = 'www.donaronlineapp.com'
    mail(to: @user.email, subject: 'Thank you!')
  end
end
