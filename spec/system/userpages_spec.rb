require 'rails_helper'

RSpec.describe "Userpages", type: :system do
  before do
    driven_by(:rack_test)
  end
  context 'On usershow page' do
    before(:each) do 
      @user = create(:user,name: "current_user")
      sign_in @user
      visit user_url(@user)
    end
  
    it "should have an image" do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it "should have a username" do
      expect(page).to have_content(@user.name)
    end
    it "should show the number of posts for the user" do
      expect(page).to have_content("Number of posts:")
    end
    it "should show the bio" do
      expect(page).to have_content("Bio")
    end
    it "should have the three most recent posts" do
      
      (1..20).each{create(:post, author: @user)}
      (1..3).each{create(:post, author: @user,title:'recent title')}      
      visit user_url(@user)
      expect(page).to have_content("recent title")
    end
    it "should have a see all posts button" do
      expect(page).to have_content("See all Posts")
    end
    context "redirect" do
      before(:each) do
        @post = create(:post, author: @user,title:'recent title')
        visit user_url(@user)
      end
      it "should be able to redirect to a posts show page" do
        first(".list-group a").click
        expect(page.current_url).to eq(user_post_url(id:@post.id,user_id:@user.id))
      end
      it "should be able to redirect to a posts idex page" do
     
        click_link "See all Posts"
        expect(page.current_url).to eq(user_posts_url(@user))
      end
    end
  end
end
