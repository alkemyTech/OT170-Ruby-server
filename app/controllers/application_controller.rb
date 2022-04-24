# frozen_string_literal: true

class ApplicationController < ActionController::API
  include AuthenticateRequest
  include Pagy::Backend

  before_action :authenticate_user!

  def admin?
    return true if current_user.role.name == 'Admin'

    render status: :unauthorized, json: {
      errors: [I18n.t('errors.controllers.unauthorized')]
    }
  end
end
