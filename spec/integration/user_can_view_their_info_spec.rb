require 'rails_helper'

RSpec.feature "user can view their own info" do
  context "as a logged in user" do
    VCR.use_cassette("products_search") do
      it "shows fullname and devices" do
        visit '/'

        click_on 'profile'
        
        expect(current_path).to eq('/user')

        expect(page).to have_content('Franz Garsombke')

      end
    end
  end
end
