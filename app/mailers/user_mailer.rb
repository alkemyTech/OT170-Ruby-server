# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'somosfundacionesmas@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Bienvenido a Somos Mas')
  end
end
