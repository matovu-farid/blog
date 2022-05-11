FactoryBot.define do
  factory :post do
    author
    title { 'title' }
    text { 'text' }
  end
end
