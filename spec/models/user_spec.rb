require 'rails_helper'

RSpec.describe User, type: :model do
  subject{User.new(name:'name',bio:'bio',photo:'photo')}
  before{subject.save}
  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'post counter should be an integer' do
    subject.posts_counter = "posts_counter"
    expect(subject).to_not be_valid
  end
  it 'post counter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
