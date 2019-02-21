class Api::ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def authorize
    key = params[:key]
    render_unauthorized unless key.present? && is_authorized?(key)
  end

  def is_authorized?(key)
    user_by_key(key).present? ? true : false
  end

  def user_by_key(key)
    User.select(:id, :name, :phone).find_by_api_key(key)
  end

  def render_ok(payload)
    message = {status: "OK", payload: payload}
    render json: message, status: :ok
  end

  def render_error(errors)
    message = {status: "BAD", errors: errors}
    render json: message, status: :bad_request
  end

  def render_unauthorized
    message = {status: "BAD", message: "Unauthorized access"}
    render json: message, status: :unauthorized
  end
end
