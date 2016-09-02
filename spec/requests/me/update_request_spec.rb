require 'rails_helper'

describe Requests::Me::UpdateRequest do
  describe 'update(user, params)' do
    let(:user) { users(:user_1) }

    context 'when sending good params' do
      let(:params) do
        {
          first_name: 'Pepe',
          last_name: 'La Rana',
          city: 'Lima'
        }
      end
      let(:expected_value) do
        {
          id: user.id,
          first_name: 'Pepe',
          last_name: 'La Rana'
        }
      end

      subject do
        described_class.update(user, params)
      end

      it { expect(subject).to eq(expected_value) }
    end

    context 'when it fails validation' do
      let(:params) do
        {
          first_name: nil,
          city: nil
        }
      end
      let(:expected_value) do
        {
          errors: ["First name can't be blank", "City can't be blank"]
        }
      end

      subject do
        described_class.update(user, params)
      end

      it { expect(subject).to eq(expected_value) }
    end
  end
end
