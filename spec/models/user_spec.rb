require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).without_validating_presence }
    it { should have_many(:likes).without_validating_presence }
    it { should have_many(:comments).without_validating_presence }
  end
  subject { User.new(name: 'name', bio: 'bio', photo: 'photo') }
  let!(:recent_posts) { subject.posts.order('created_at Desc').limit(3) }
  before { subject.save }
  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'post counter should be an integer' do
    subject.posts_counter = 'posts_counter'
    expect(subject).to_not be_valid
  end
  it 'post counter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  it 'should return the recent posts' do
    expect(subject.last_three_posts).to match(recent_posts)
  end
end
