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

describe 'PATCH /v2/me', type: :request do
  before do
    allow_any_instance_of(V2::MeController).to receive(:current_user) { users(:user_1) }

    patch '/v2/me', params: params.to_json, headers: { 'Content-Type' => 'application/json' }
  end

  context 'when we send all good params' do
    let(:params) do
      {
        first_name: 'Pepe',
        last_name: 'La Rana',
        city: 'Lima'
      }
    end

    it { expect(response).to have_http_status(:ok) }

    it { expect(response).to match_response_schema 'user_profile' }
  end

  context 'when we send bad params' do
    let(:params) do
      {
        first_name: nil,
        city: nil
      }
    end

    it { expect(response).to have_http_status(:unprocessable_entity) }

    it { expect(response).to match_response_schema 'error_response' }
  end
end
