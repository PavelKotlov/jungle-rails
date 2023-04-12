require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validation' do
    context 'create new user' do
      it "saved successfully" do
        @user = User.new(
          first_name: 'bob',
          last_name: 'smith',
          email: 'bobsmith@shaw.ca',
          password: 'pass123',
          password_confirmation: 'pass123'
        )
        expect(@user).to be_valid
      end

      it "fails when first name is missing " do
        @user = User.new(
          first_name: nil,
          last_name: 'smith',
          email: 'bobsmith@shaw.ca',
          password: 'pass123',
          password_confirmation: 'pass123'
        )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
      end
      
      it "fails when last name is missing " do
        @user = User.new(
          first_name: 'bob',
          last_name: nil,
          email: 'bobsmith@shaw.ca',
          password: 'pass123',
          password_confirmation: 'pass123'
        )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
      end

      it "fails when email is missing " do
        @user = User.new(
          first_name: 'bob',
          last_name: 'smith',
          email: nil,
          password: 'pass123',
          password_confirmation: 'pass123'
        )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
      end

      it "fails when password and password confirmation are missing " do
        @user = User.new(
          first_name: 'bob',
          last_name: 'smith',
          email: 'bobsmith@shaw.ca',
          password: nil,
          password_confirmation: nil
        )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Password can't be blank")
      end

      it "fails when password and password confirmation do not match" do
        @user = User.new(
          first_name: 'bob',
          last_name: 'smith',
          email: 'bobsmith@shaw.ca',
          password: 'pass123',
          password_confirmation: 'password123'
        )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
      end

      it 'fails when password is less than 4 characters' do
        @user = User.new(
          first_name: 'bob',
          last_name: "smith",
          email: 'bobsmith@shaw.ca',
          password: '123',
          password_confirmation: '123'
        )

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 4 characters)")
      end

      it 'fails when user exists with same email' do
        @user_one = User.create(
          first_name: 'jane',
          last_name: "smith",
          email: 'jsmith@gmail.com',
          password: 'pass123',
          password_confirmation: 'pass123'
        )
  
        @user_two = User.create(
          first_name: 'john',
          last_name: "smith",
          email: 'jsmith@gmail.com',
          password: 'pass123',
          password_confirmation: 'pass123'
        )

        expect(@user_two).to_not be_valid
        expect(@user_two.errors.full_messages[0]).to eq("Email has already been taken")
      end
    end
  end

  describe '.authenticate_with_credentials' do
    context 'given correct user credentials' do
      it 'logs in and redirects to main page' do
        @user = User.create(
          first_name: 'bob',
          last_name: "smith",
          email: 'bobsmith@shaw.ca',
          password: 'pass123',
          password_confirmation: 'pass123'
        )
        
        expect(User.authenticate_with_credentials('bobsmith@shaw.ca', 'pass123')).to eq(@user)
      end
    end

    context 'given correct misstyped user credentials' do
      it 'logs in with half characters in email as uppercase' do
        @user = User.create(
          first_name: 'bob',
          last_name: "smith",
          email: 'bobsmith@shaw.ca',
          password: 'pass123',
          password_confirmation: 'pass123'
        )
        
        expect(User.authenticate_with_credentials('bobSMITH@shaw.CA', 'pass123')).to eq(@user)
      end

      it 'logs in with extra white spaces before and after the email' do
        @user = User.create(
          first_name: 'bob',
          last_name: "smith",
          email: 'bobsmith@shaw.ca',
          password: 'pass123',
          password_confirmation: 'pass123'
        )
        
        expect(User.authenticate_with_credentials('    bobsmith@shaw.ca     ', 'pass123')).to eq(@user)
      end
    end
  end

end