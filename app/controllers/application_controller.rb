class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
      auth_header = request.headers["Authorization"]
      if !auth_header
          render json: {error: "No token"}, status: :unauthorized
      else
          begin
              token = auth_header.split(" ")[1]
              secret = Rails.application.secret_key_base
              payload = JWT.decode(token, secret)[0]
              @user = User.find payload["user_id"]
          rescue
              render json: {error: "Bad token"}, status: :forbidden
          end
      end
  end

end
