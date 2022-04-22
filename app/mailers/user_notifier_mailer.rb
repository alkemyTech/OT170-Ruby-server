class UserNotifierMailer < ApplicationMailer
    default from: ENV['DEFAULT_FROM_EMAIL_ADDRESS']
  
    def send_email_to(email_address)
      mail(to: email_address,
           subject: 'This should be an empty mail, unless edited.')
    end
end