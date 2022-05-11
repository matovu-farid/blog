require 'rails_helper'

RSpec.describe "Userpages", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "should be able to redirect to a users show page" do
    create(:user,name: "clicked")
    visit '/'
    expect(page).to_not have_content("Bio")
     
    page.first('a',text:'clicked').click
    expect(page).to have_content('Bio')
  end
end
