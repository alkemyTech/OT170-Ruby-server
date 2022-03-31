# frozen_string_literal: true

module Middleware
  class Ownership
    def initialize(app)
      @app = app
    end

    def call(env)
      Rack::Request.new(env)
      @user = User.find(params[:user][:id])

      if @current_user == @user || @current_user.admin?
        _status, _headers, _response = @app.call(env)
      else
        [403, { 'Content-Type' => 'text/plain' }, 'Forbidden Error']
      end
    end
  end
end
