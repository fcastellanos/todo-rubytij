require 'rails_helper'

describe UserDecorator do
  describe '#to_hash' do
    context 'when we pass a user' do
      let(:user) { users(:user_1) }
      let(:expected_value) do
        {
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name
        }
      end

      subject { described_class.new(user) }

      it { expect(subject.to_hash).to eq(expected_value) }
    end

    context 'when we pass nil' do
      let(:expected_value) do
        {
          errors: ['The user could not be found']
        }
      end

      subject { described_class.new(nil) }

      it { expect(subject.to_hash).to eq(expected_value) }
    end
  end
end
