class JsonWebToken
  HMAC_SECRET = 'f4S5ZodyS4Iomoy166ws5mXfVh7uYR6u'.freeze

  def self.encode(payload, exp = 48.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end
