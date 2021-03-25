# rubocop:disable Style/RescueStandardError

module AuthenticateUser
  def authenticate
    if request.headers['Authorization']
      begin
        token = request.headers['Authorization'].split(' ')[1]

        decoded_token = JWT.decode(token, secret)

        payload = decoded_token.first

        @user = User.find(payload['user_id'])
      rescue => e
        render json: { message: "Error: #{e}" }, status: :forbidden
      end
    else
      render json: { message: 'No Authorization header was sent' }, status: :forbidden
    end
  end

  def secret
    ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
  end

  def create_token(payload)
    JWT.encode(payload, secret)
  end
end
# rubocop:enable Style/RescueStandardError
