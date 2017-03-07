module Api
  class AuthenticatedController < ApplicationController
    acts_as_token_authentication_handler_for User
  end
end
