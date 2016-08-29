require 'rails_helper'

describe 'GET /v2/me', type: :request do
  let(:user) { users(:user_1) }

  before(:each) do
    get '/v2/me'
  end

  it { expect(response).to have_http_status(200) }

  it 'matches the JSON expectation' do
    expect(response).to match_response_schema 'user_profile'
  end
end
