module Features
  module SessionHelpers

    def create_customer(name, email, address)
      visit '/customers/new'
      expect(page).to have_content('New Customer')

      fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'Address', with: address
      click_button 'Create Customer'
    end

  end
end
