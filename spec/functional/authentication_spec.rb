require 'rails_helper'

describe 'Authentication' do
  before do
    User.create!(email: 'user@example.com', encrypted_password: PasswordEncryptor.encrypt('password'))
  end

  it 'should be possible to log in with proper email and password' do
    auth = Authentication.new('user@example.com', 'password')
    expect(auth.token).not_to be_nil
  end

  it 'should not be able to log in with incorrect email' do
    auth = Authentication.new('wrong@example.com', 'password')
    expect(auth.token).to be_nil
  end

  it 'should not be able to log in with incorrec password' do
    auth = Authentication.new('user@example.com', 'wrong')
    expect(auth.token).to be_nil
  end
end
