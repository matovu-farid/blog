require 'rails_helper'

RSpec.describe 'UserPostIndices', type: :system do
  before do
    driven_by(:rack_test)
  end

  before do
    driven_by(:rack_test)
  end
  before(:each) do
    @user = create(:user, name: 'current_user')
    @visited = create(:user, name: 'visited_user')
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
  describe 'With Post' do
    before(:each) { @post = create(:post, author: @visited) }
    it 'should be able to see the number of posts the user has written' do
      visit user_posts_url(@visited)
      expect(page).to have_content('Number of posts: 1')
    end
    it 'should be able to see a posts title' do
      visit user_posts_url(@visited)
      expect(page).to have_content('title')
    end
    it 'should be able to see a posts body' do
      visit user_posts_url(@visited)
      expect(page).to have_content('text')
    end
    context 'With Comment' do
      before(:each) { @comment = create(:comment, author: @user, post: @post) }
      it 'should be able to see the comments on the post' do
        visit user_posts_url(@visited)
        expect(page).to have_content('comment')
      end
      it 'should be able to see the number of comments per post' do
        visit user_posts_url(@visited)
        expect(page).to have_content('Comments: 1')
      end
    end
    it 'should be able to see the number of likes on a post' do
      visit user_posts_url(@visited)
      expect(page).to have_content('Likes: 0')
    end
    it 'should be able to see the a section for pagination' do
      visit user_posts_url(@visited)
      expect(page).to have_content('Next')
      expect(page).to have_content('Next')
    end
    it 'should be able to redirect to a post show page when a post is clicked' do
      visit user_posts_url(@visited)
      first('.post a').click
      expect(page.current_url).to eq(user_post_url(id: @post.id, user_id: @visited.id))
    end
  end
end
