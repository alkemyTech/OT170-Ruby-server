# frozen_string_literal: true

module RoleRequest
  extend ActiveSupport::Concern
  require 'json_web_token'
  include AuthenticateRequest

  def authenticate_role!
    return if current_role

    render status: :unauthorized, json: {
      errors: [I18n.t('errors.controllers.unauthorized')]
    }
  end

  def current_role
    return unless decoded_token

    data = decoded_token
    user = User.find_by(id: data[:user_id])
    role = 0

    return unless role == 1

    @current_role ||= role
  end
end
