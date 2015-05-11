require "application_responder"

class ApplicationController < ActionController::API
  include ActionController::RespondWith
  self.responder = AppResponder
  respond_to :json
end
