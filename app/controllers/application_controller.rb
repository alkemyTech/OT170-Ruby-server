# frozen_string_literal: true

class ApplicationController < ActionController::API
  include AuthenticateRequest

  before_action :authenticate_user!
end
