When(/^I send a request to create a note$/) do
  @note_title = "tile example"
  steps %(
    When I send a POST request to "api/notes" with the following:
      """
      {
        "note": {
            "title": "#{@note_title}",
            "content": "content example"
        }
      }
      """
  )
end

Then(/^the response should be the note$/) do
  expect(JSON.parse(last_response.body)['title']).to eq(@note_title)
end

When(/^I send a request to update a note$/) do
  note_id = JSON.parse(last_response.body)['id']

  @note_title = "tile updated"
  steps %(
    When I send a PUT request to "api/notes/#{note_id}" with the following:
      """
      {
        "note": {
            "title": "#{@note_title}"
        }
      }
      """
  )
end
