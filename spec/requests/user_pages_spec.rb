require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "Users profile page" do 
    let(:user) { FactoryGirl.create(:user)}
  	before { visit user_path(user) }
  	it { should have_selector('h1', text: user.name) }
  	it { should have_selector('title',text: user.name) }
  end

  describe "sign up" do
    before { visit signup_path}
    let(:submit) { "create my account"}

  describe "with valid info" do
    before do 
      fill_in "Name", with: "Example user"
      fill_in "Email", with: "exampleuser@railstutorials.org"
      fill_in "Password", with: "foobar"
      fill_in "Password confirmation" , with: "foobar"
    end
    it "should create a user" do
      expect { click_button submit }.to change(User , :count).by(1)
    end
  end

  describe "with invalid info" do
    it " should not create a user " do
      expect { click_button submit }.not_to change(User , :count)
    end
  end
  end
end