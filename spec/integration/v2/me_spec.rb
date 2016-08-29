require 'rails_helper'

describe 'GET /v2/me', type: :request do
  before(:each) do
    get '/v2/me'
  end

  it { expect(response).to have_http_status(200) }

  it { expect(response).to match_response_schema 'user_profile' }
end
