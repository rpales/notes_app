class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }

  respond_to :json

  rescue_from ActionController::ParameterMissing do
    respond_to do |format|
      format.json do
        render json: { error:  'parameters missing' }, status: 422
      end
    end
  end
end
