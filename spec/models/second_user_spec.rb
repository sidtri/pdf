require 'spec_helper'

describe SecondUser do
  
    before do
   		@user = SecondUser.new(name: "example user", email: "user@example.com")
    end
    subject { @user }
        it { should respond_to(:name)}
  		it { should respond_to(:email)}
  		it { should be_valid }

    describe "when name is not present " do 
  		before { @user.name = ''}
  		it { should_not be_valid}
    end

    describe "when email is not present" do
  		before { @user.email = "" }
  		it { should_not be_valid}
  	end

    describe "when length exceeds fifty " do
  		before { @user.name = "a" * 51 }
  		it { should_not be_valid }
    end

  	describe 'when email format is valid' do 
		it "should be valid " do 
			addresses = %w[user@foo.COM frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end
		end
	end
	describe 'when email address is already taken' do 
		before do
			user_with_same_email = @user.dup
			user_with_same_email.save
		end
		it { should_not be_valid}
	end

end
