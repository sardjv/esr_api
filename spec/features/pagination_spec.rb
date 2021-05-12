require 'rails_helper'

RSpec.feature 'Pagination', type: :feature do
  before { login_as create(:user), scope: :user }

  context 'with resources of type DisabilityRecord' do
    before do
      5.times do |n|
        create(:disability_record, id: n, Category: "Category #{n}")
      end
    end
    it 'can paginate' do
      visit ui_disability_records_path(per_page: 3)
      expect(page).to have_content 'Disability Records'

      expect(page).to have_content 'Category 0'
      expect(page).to have_content 'Category 1'
      expect(page).to have_content 'Category 2'
      expect(page).not_to have_content 'Category 3'
      expect(page).not_to have_content 'Category 4'

      within('.pagination') do
        click_on 'Next'
      end

      expect(page).not_to have_content 'Category 0'
      expect(page).not_to have_content 'Category 1'
      expect(page).not_to have_content 'Category 2'
      expect(page).to have_content 'Category 3'
      expect(page).to have_content 'Category 4'
    end
  end
end
