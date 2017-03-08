class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  respond_to :json

  rescue_from ActionController::ParameterMissing do
    respond_to do |format|
      format.json do
        render json: { error:  'parameters missing' }, status: 422
      end
    end
  end
end
