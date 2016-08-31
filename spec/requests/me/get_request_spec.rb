require 'rails_helper'

describe Requests::Me::GetRequest do
  describe 'get(user)' do
    context 'when the user is present' do
      let(:user) { users(:user_1) }
      let(:expected_value) do
        {
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name
        }
      end

      subject do
        described_class.get(user)
      end

      it { expect(subject).to eq(expected_value) }
    end

    context 'when the user is not present' do
      let(:expected_response) do
        {
          errors: ['The user could not be found']
        }
      end

      subject do
        described_class.get(nil)
      end

      it { expect(subject).to eq(expected_response) }
    end
  end
end
