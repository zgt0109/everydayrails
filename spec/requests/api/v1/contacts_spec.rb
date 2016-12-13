require 'rails_helper'
# 有待完善， url 为nil
  describe 'Contacts API', type: :request do
  it 'sends an individual contact' do
  contact = FactoryGirl.create(:contact)
  get "/api/contacts/#{contact.id}", nil, \
  { 'HTTP_ACCEPT' => 'application/vnd.contacts.v1' }
  expect(response.code).to eq 200
  json = JSON.parse(response.body)
  expect(json['firstname']).to eq contact.firstname
  expect(json['lastname']).to eq contact.lastname
  expect(json['email']).to eq contact.email
  # Etc.
  end
end