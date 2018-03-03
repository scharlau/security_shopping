require 'spec_helper'
require 'rails_helper'

feature 'create customer' do
    scenario "can create customer" do
        create_customer('Sharon Harrison', 'sharon@harrison.com', '54 Main Street')
        expect(page).to have_content('Name: Sharon Harrison')
        create_customer('Arron Jones', 'arron@jones.com', '878 High Road')
        expect(page).to have_content('Name: Arron Jones')
        visit '/customers'
        expect(page).to have_content('Arron Jones')
    end

end
