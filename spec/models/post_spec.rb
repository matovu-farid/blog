require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    subject { Post.new(title: 'title', text: 'text') }

    before { subject.save }
    it 'should have a title' do
      subject.title = nil
      expect(subject).not_to be_valid
    end
    it 'should have text' do
      subject.text = nil
      expect(subject).not_to be_valid
    end
    it 'title length should be greater than 250' do
      subject.title = 'a' * 251
      expect(subject).not_to be_valid
    end
    it 'comments counter should be an integer' do
      subject.comments_counter = 'posts_counter'
      expect(subject).to_not be_valid
    end
    it 'comments counter should be greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
    it 'likes counter should be an integer' do
      subject.likes_counter = 'likes_counter'
      expect(subject).to_not be_valid
    end
    it 'likes counter should be greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
    let!(:recent_comments) { subject.comments.order('created_at Desc').limit(5) }
    it 'should return the recent posts' do
      expect(subject.recent_comments).to match(recent_comments)
    end
  end
end
