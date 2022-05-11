FactoryBot.define do
  factory :comment do
    author
    post
    text { 'comment' }
  end
end
