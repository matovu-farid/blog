require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:post).without_validating_presence }
end
