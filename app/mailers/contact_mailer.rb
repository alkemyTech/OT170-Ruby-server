# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  default from: 'somosfundacionesmas@gmail.com'

  def invite
    @contact = params[:contact]
    @url = 'http://127.0.0.1:3000/api/v1/register'
    mail(to: @contact.email, subject: 'Te invitamos a sumarte')
  end
end
