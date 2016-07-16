require 'rails_helper'

describe AuthorizeRequest do
  let!(:user) { create :user }
  let(:valid_token) { { 'uid' => user.email, 'Authorization' => user.token } }
  let(:invalid_token) { { 'uid' => 'invalid', 'Authorization' => 'invalid' } }

  context '#call' do
    context 'with valid token and uid' do
      it "should success" do
        expect(AuthorizeRequest.call(valid_token)).to be_success
      end

      it "should retuen user" do
        expect(AuthorizeRequest.call(valid_token).result).to eq(user)
      end
    end

    context 'with invalid credentials' do
      fit 'should raise InvalidToken error' do
        expect do
          AuthorizeRequest.call(invalid_token)
        end.to raise_error Exceptions::InvalidToken
      end
    end
  end
end
