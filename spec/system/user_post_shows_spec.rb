require 'rails_helper'

RSpec.describe 'UserPostShows', type: :system do
  before do
    driven_by(:rack_test)
  end
  before(:each) do
    @user = create(:user, name: 'current_user')
    @visited = create(:user, name: 'visited_user')
    sign_in @user
  end
  before(:each) { @post = create(:post, author: @visited) }

  it 'should be able to see a posts title' do
    visit user_post_url(id: @post.id, user_id: @visited.id)
    expect(page).to have_content('title')
  end
  it 'should be able to see a posts author' do
    visit user_post_url(id: @post.id, user_id: @visited.id)
    expect(page).to have_content(@visited.name)
  end
  it 'should be able to see the number of comments' do
    visit user_post_url(id: @post.id, user_id: @visited.id)
    expect(page).to have_content('Comments: 0')
  end
  it 'should be able to see the number of likes' do
    visit user_post_url(id: @post.id, user_id: @visited.id)
    expect(page).to have_content('Likes: 0')
  end
  it 'should be able to see a posts body' do
    visit user_post_url(id: @post.id, user_id: @visited.id)
    expect(page).to have_content('text')
  end
  it 'should be able to see a the name of a commenter on a post' do
    create(:comment, author: @user, post: @post)
    visit user_post_url(id: @post.id, user_id: @visited.id)
    expect(page).to have_content(@user.name)
  end
  it 'should be able to see a the comment each commenter left' do
    create(:comment, author: @user, post: @post)
    visit user_post_url(id: @post.id, user_id: @visited.id)
    expect(page).to have_content('comment')
  end
end
