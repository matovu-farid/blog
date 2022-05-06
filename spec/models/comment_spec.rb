require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:post).without_validating_presence }
  it { should belong_to(:post).without_validating_presence }
  it 'should have text' do
    subject = Comment.new(text: nil)

    expect(subject).not_to be_valid
  end
end
