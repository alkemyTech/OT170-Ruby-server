# frozen_string_literal: true

class JsonWebToken
  require 'jwt'

  SECRET_KEY = Rails.application.secret_key_base
  JWT_EXPIRY = 1.day

  def self.encode(payload, exp = JWT_EXPIRY.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY, 'HS256', { typ: 'JWT' })
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY, false)[0]
    res = HashWithIndifferentAccess.new decoded
    res if Time.zone.at(res[:exp]) > Time.zone.now
  rescue StandardError
    nil
  end
end
