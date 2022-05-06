require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:author).without_validating_presence }

  describe "validations" do
    subject{Post.new(title: 'title',text:'text')}
    before{subject.save}
    it 'should have a title' do
      subject.title = nil
      expect(subject).not_to be_valid
    end  
    it 'should have text' do
      subject.text = nil
    end
    it 'comments counter should be an integer' do
      subject.comments_counter = "posts_counter"
      expect(subject).to_not be_valid
    end
    it 'comments counter should be greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
    it 'likes counter should be an integer' do
      subject.likes_counter = "likes_counter"
      expect(subject).to_not be_valid
    end
    it 'likes counter should be greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
  
end
