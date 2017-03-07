module Api
  class SessionsController < ApplicationController
    include Devise::Controllers::Helpers

    skip_before_filter :verify_authenticity_token

    def create
      user = User.where(email: session_params[:email]).first
      respond_to do |format|
        format.json do
          if user && user.valid_password?(session_params[:password])
            render json: user
          else
            render json: { error: 'invalid username/password combination' }
          end
        end
      end
    end

    private

    def session_params
      params.require(:session).permit(:email, :password).tap do |parameters|
        parameters.require(:email)
        parameters.require(:password)
      end
    end
  end
end
