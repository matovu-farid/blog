require 'rails_helper'

RSpec.describe "UserPostIndices", type: :system do
  before do
    driven_by(:rack_test)
  end

  before do
    driven_by(:rack_test)
  end
  before(:each) do 
    @user = create(:user,name: "current_user")
    @visited = create(:user,name: "visited_user")
    sign_in @user
  end
  
 
    it "should be able to see the user's profile picture" do
      visit user_posts_url(@visited)
      expect(page).to have_css("img[src*='#{@visited.photo}']")
    end
    it "should be able to see the user's name" do
      visit user_posts_url(@visited)
      expect(page).to have_content(@visited.name)
    end
    context "For Post" do
      before(:each){@post = create(:post, author: @visited,title:'title')}
      it "should be able to see the number of posts the user has written" do
        visit user_posts_url(@visited)
        expect(page).to have_content("Number of posts: 1")
      end
      it "should be able to see a posts title" do
        visit user_posts_url(@visited)
        expect(page).to have_content('title')
      end
  end  
  # it "should be able to redirect to a users show page" do
  
  #  visit root_url
     
  #   page.first("a[href*='#{user_path(@user)}']").click
  #   expect(current_url).to eq(user_url(@user))
  # end
end
