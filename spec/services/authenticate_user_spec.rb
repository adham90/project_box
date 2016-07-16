require 'rails_helper'

describe AuthenticateUser do
  let!(:user) { create :user }

  context '#call' do
    context 'with valid credentials' do
      it "should success" do
        expect(AuthenticateUser.call(user.email, user.password)).to be_success
      end

      it "should regentate user token" do
        expect do
          AuthenticateUser.call(user.email, user.password)
          user.reload
        end.to change(user, :token)
      end
    end

    context 'with invalid credentials' do
      it "should raise invalid credentials error" do
        expect do
          AuthenticateUser.call('invalid', 'invalid')
        end.to raise_error Exceptions::InvalidCredentials
      end
    end
  end
end
