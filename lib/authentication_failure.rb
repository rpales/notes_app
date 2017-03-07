# override devise authentication failure response
# must be included in devise.rb initializer

class AuthenticationFailure < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = 'application/json'
    self.response_body = {"errors" => ["Invalid login credentials"]}.to_json
  end
end
