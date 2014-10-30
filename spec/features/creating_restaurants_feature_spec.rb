require 'rails_helper'

describe 'creating restaurants' do

  context 'a valid restaurant' do

    it 'prompts the user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'

      fill_in 'Name', with:('La Familiglia')
      click_button('Create Restaurant')

      expect(page).to have_content('La Familiglia')
      expect(current_path). to eq('/restaurants')
    end

  end

  context 'an invalid restaurant, due to an uncapitalized name that is too short' do

    it 'does not display an invalid restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'ab'

      click_button 'Create Restaurant'
      expect(page).to have_content 'errors'
      expect(page).not_to have_content 'ab'
    end
  end

end
