require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'it can be reached' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'it has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end

    it 'has a form to create Posts' do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      visit new_post_path

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Flavortown"
      click_on 'submit'

      expect(page).to have_content(Date.today)
      expect(page).to have_content("Flavortown")
    end
  end
end
