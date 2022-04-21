# frozen_string_literal: true

class ApplicationController < ActionController::API
  include AuthenticateRequest
  include Pagy::Backend

  before_action :authenticate_user!
end
