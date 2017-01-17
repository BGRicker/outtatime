require 'rails_helper'

describe 'navigate' do
	describe 'index' do
		it 'can be reached successfully' do
			visit posts_path
			expect(page.status_code).to eq(200)
		end

		it 'requires a login' do
			visit posts_path
			expect(page).to have_content(/Log in/ && /Sign up/)
		end
	end

	describe 'creation' do
		before do
			user = User.create(email: "Guy@Fieri.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Guy", last_name: "Fieri")
			login_as(user, :scope => :user)
			visit new_post_path
		end

		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Flavorsquad"
			click_on "Save"

			expect(page).to have_content("Flavorsquad")
		end

		it 'will have a user associated it' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "did you hear about all the bees"
			click_on "Save"

			expect(User.last.posts.last.rationale).to eq("did you hear about all the bees")
		end
	end
end
