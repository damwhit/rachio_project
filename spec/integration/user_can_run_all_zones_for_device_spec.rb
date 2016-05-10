require 'rails_helper'

RSpec.feature "user can run all zones for a given device" do
  context "as a logged in user" do
    VCR.use_cassette("zone_info") do
      it "shows fullname and devices" do

        visit '/user'

        expect(current_path).to eq('/user')

        find("#c761bfa0-4c49-4b4f-8a79-04e42bea881a").click

        expect(current_path).to eq('/device')

        within('div.row') do
          expect(page).to have_content('device c761bfa0-4c49-4b4f-8a79-04e42bea881a')
          expect(page).to have_content('ONLINE')
        end

      end
    end
  end
end
