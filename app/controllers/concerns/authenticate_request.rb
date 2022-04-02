# frozen_string_literal: true

module AuthenticateRequest
  extend ActiveSupport::Concern
  require 'json_web_token'

  def authenticate_user!
    return if current_user

    render status: :unauthorized, json: {
      errors: [I18n.t('errors.controllers.auth.unauthenticated')]
    }
  end

  def current_user
    return unless decoded_token

    data = decoded_token
    user = User.find_by(id: data[:user_id])
    session = Session.search(data[:user_id], data[:token])

    return unless user && session && session.status

    session.used
    @current_user ||= user
  end

  def decoded_token
    return unless request.headers['Authorization']

    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded_token ||= JsonWebToken.decode(header)
    rescue Error => e
      render json: { errors: [e.message] }, status: :unauthorized
    end
  end
end
