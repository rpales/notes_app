module Api
  class RegistrationsController < ::Devise::RegistrationsController
    skip_before_filter :verify_authenticity_token
  end
end
