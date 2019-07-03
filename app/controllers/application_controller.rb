class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exception

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      binding.pry()
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
