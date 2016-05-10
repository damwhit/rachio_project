require 'rails_helper'

RSpec.feature "user can view their own info" do
  context "as a logged in user" do
    VCR.use_cassette("products_search") do
      it "shows fullname and devices" do
        visit '/'

        click_on 'profile'

        expect(current_path).to eq('/user')

        expect(page).to have_content('Rachio Beta')
        expect(page).to have_content('devices')
        expect(page).to have_content('c761bfa0-4c49-4b4f-8a79-04e42bea881a')
      end
    end
  end
end
