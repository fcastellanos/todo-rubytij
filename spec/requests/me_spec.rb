require 'rails_helper'

describe Requests::Me do
  describe '.show(user)' do
    context 'when the user is present' do
      it 'builds a success response' do
      end
    end

    context 'when the user is not present' do
      it 'returns a user not found response' do
      end
    end
  end
end
