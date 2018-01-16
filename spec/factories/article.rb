FactoryBot.define do
  factory :article do
    sequence :url do |n|
      "url/to/original/article#{n}"
    end
  end
end
