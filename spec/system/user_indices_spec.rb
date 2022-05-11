require 'rails_helper'

RSpec.describe "UserIndices", type: :system do
  before do
    driven_by(:rack_test)
  end
  before(:each) do 
    user = create(:user,name: "current_user")
    sign_in user
  end
  it "should be able to view other users" do
    create(:user,name: "other")
    visit '/'
    expect(page).to have_content("other")
  end
  context "for each user" do 
    let(:other_user){ create(:user,name: "other")}
    it "should be able to profile picture" do
      visit '/'
      expect(page).to have_css("img[src*='#{other_user.photo}']")
    end
    it "should be able to see the number of posts" do
      post = create(:post, author: other_user)
      visit '/'
      expect(page).to have_content("Number of posts: 1")
    end
  end
  it "should be able to redirect to a users show page" do
    create(:user,name: "clicked")
    visit '/'
    expect(page).to_not have_content("Bio")
     
    page.first('a',text:'clicked').click
    expect(page).to have_content('Bio')
  end
end
