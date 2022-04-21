# frozen_string_literal: true

module CreateSession
  extend ActiveSupport::Concern
  require 'json_web_token'

  def jwt_session_create(user)
    session = user.sessions.build
    return unless user && session.save

    jwt_create(user, session)
  end

  def jwt_create(user, session)
    JsonWebToken.encode(
      {
        user_id: user.id,
        user_first_name: user.first_name,
        user_last_name: user.last_name,
        user_email: user.email,
        token: session.token
      }
    )
  end
end
