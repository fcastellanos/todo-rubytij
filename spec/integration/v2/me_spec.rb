require 'rails_helper'

describe 'GET /v2/me', type: :request do
  context 'when the user is present' do
    before do
      allow_any_instance_of(V2::MeController).to receive(:current_user) { users(:user_1) }

      get '/v2/me'
    end

    it { expect(response).to have_http_status(:ok) }

    it { expect(response).to match_response_schema 'user_profile' }
  end

  context 'when the user is not present' do
    before do
      get '/v2/me'
    end

    it { expect(response).to have_http_status(:not_found) }

    it { expect(response).to match_response_schema 'error_response' }
  end
end
