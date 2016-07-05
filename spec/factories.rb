FactoryGirl.define do
	factory :user do
		name "mike"
		email "mike@domain.com"
		password "foobar"
		password_confirmation "foobar"
	end
end