require 'rails_helper'

describe Requests::Me do
  describe '.show(user)' do
    context 'when the user is present' do
      let(:user) { users(:user_1) }
      let(:expected_response) do
        {
          json: UserDecorator.new(user).to_hash,
          status: :ok
        }
      end

      subject do
        described_class.show(user)
      end

      it { expect(subject).to eq(expected_response) }
    end

    context 'when the user is not present' do
      let(:expected_response) do
        {
          json: {
            errors: ['The user could not be found']
          },
          status: :not_found
        }
      end

      subject do
        described_class.show(nil)
      end

      it { expect(subject).to eq(expected_response) }
    end
  end

  describe '.update(user, params)' do
    let(:user) { users(:user_1) }

    context 'when sending good params' do
      let(:params) do
        {
          first_name: 'Pepe',
          last_name: 'La Rana',
          city: 'Lima'
        }
      end
      let(:expected_response) do
        {
          json: UserDecorator.new(user).to_hash,
          status: :ok
        }
      end

      subject do
        described_class.update(user, params)
      end

      it { expect(subject).to eq(expected_response) }
    end

    context 'when it fails validation' do
      let(:params) do
        {
          first_name: nil,
          city: nil
        }
      end
      let(:expected_response) do
        {
          json: {
            errors: ["First name can't be blank", "City can't be blank"]
          },
          status: :unprocessable_entity
        }
      end

      subject do
        described_class.update(user, params)
      end

      it { expect(subject).to eq(expected_response) }
    end
  end
end
