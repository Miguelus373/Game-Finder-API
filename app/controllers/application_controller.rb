class ApplicationController < ActionController::API
  include ExceptionHandler
  include AuthenticateUser

  before_action :authenticate
end
