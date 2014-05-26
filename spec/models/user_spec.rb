require 'spec_helper'

describe User do
  before :each do #instantiates a new user before each test
    @user = User.create(name: "John Smith", email: "john@smith.com", password: "1234567890", password_confirmation: "1234567890")
  end

  it 'should be able to be created' do #test that model/table set up correctly
    @user.should be_valid
  end

  it 'should respond to name, phone, email' do #test that user has these dot methods
    @user.should respond_to(:name)
    @user.should respond_to(:phone)
    @user.should respond_to(:email)
  end

  it 'should have a valid email' do #test email regex validation in config/initializers/devise.rb
    emails = %w[john@smith,com john_at_smith.org example.john@smith.]
    emails.each do |email|
      user = User.create(name: "John Smith", email: email, password: "1234567890", password_confirmation: "1234567890")
      user.should_not be_valid
    end
  end

  it 'should have a unique email' do #test devise uniquess validation
    user2 = User.create(name: "Jane Smith", email: "john@smith.com", password: "1234567890", password_confirmation: "1234567890")
    user2.should_not be_valid
  end

  it 'should have a name' do #test user has name 
    user3 = User.create(email: "john3@smith.com", password: "1234567890", password_confirmation: "1234567890")
    user3.should_not be_valid
  end

  

end
