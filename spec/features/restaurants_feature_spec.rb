require 'rails_helper'

describe 'restaurants' do

  context 'when no restaurants have been added' do

    it 'should display a prompt to add to a restaurant' do
      visit '/restaurants'
      expect(page).to have_content('There are currently no registered restaurants')
      expect(page).to have_link('Add a restaurant')
    end

  end

  context 'when restaurants have been added' do

    before(:each) do
      Restaurant.create(name: 'McDonalds')
    end

    it 'should display them' do
      visit '/restaurants'
      expect(page).to have_content('McDonalds')
      expect(page).to have_link('Add a restaurant')
    end

  end

  context 'editing restaurants' do

    before (:each) do
      Restaurant.create(name: 'KFC')
    end

    it 'edits a restaurant name' do
      visit '/restaurants'
      click_link 'Edit KFC'

      fill_in 'Name', with: 'Kentucky Fried Chicken'
      click_button 'Update Restaurant'

      expect(page).to have_content('Kentucky Fried Chicken')
      expect(current_path).to eq('/restaurants')
    end
  end

  context 'deleting restaurants' do

    before (:each) do
      Restaurant.create(name: 'KFC')
    end

    it 'deletes an existing restaurant' do
      visit '/restaurants'
      click_link 'Delete KFC'

      expect(page).not_to have_content('KFC')
      expect(page).to have_content('Restaurant deleted successfully')
      expect(current_path).to eq('/restaurants')
    end
  end


end
