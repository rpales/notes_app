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
  expect(JSON.parse(last_response.body)['email']).to eq(@user_email)
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
    When I send a POST request to "sessions" with the following:
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
    When I send a POST request to "sessions" with the following:
      """
      {
        "session": {
            "email": "#{@user_email}"
        }
      }
      """
  )
end

Given(/^that I am logged in as a user$/) do
  steps %(
    When I send a request to create an user
  )
  @user_email = JSON.parse(last_response.body)['email']

  header 'X-User-Email', @user_email
  header 'X-User-Token', JSON.parse(last_response.body)['authentication_token']
end
