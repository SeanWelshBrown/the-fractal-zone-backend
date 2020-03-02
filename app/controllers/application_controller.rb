class ApplicationController < ActionController::API

  def encode_token(payload)
    JWT.encode(payload, 'birdfeet')
  end

  def decoded_token(token)
    
  end

end
