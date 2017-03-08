When(/^I send a request to create an user$/) do
  @user_email = 'example@example.com'
  steps %(
    When I send a POST request to "/users" with the following:
      """
      {
        "user": {
            "email": "#{@user_email}",
            "password": "123123"
        }
      }
      """
  )
end

Then(/^the response should be the user$/) do
  JSON.parse(last_response.body)['email'] = @user_email
end

When(/^I send a request to create an user with missing parameters$/) do
  @user_email ||= 'example@example.com'
  steps %(
    When I send a POST request to "/users" with the following:
      """
      {
        "user": {
            "email": "#{@user_email}"
        }
      }
      """
  )
end

When(/^I send a request to create a session$/) do
  @user_email ||= 'example@example.com'
  steps %(
    When I send a POST request to "api/sessions" with the following:
      """
      {
        "session": {
            "email": "#{@user_email}",
            "password": "123123"
        }
      }
      """
  )
end

When(/^I send a request to create a session with missing parameters$/) do
  @user_email ||= 'example@example.com'
  steps %(
    When I send a POST request to "api/sessions" with the following:
      """
      {
        "session": {
            "email": "#{@user_email}"
        }
      }
      """
  )
end
