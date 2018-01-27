FactoryBot.define do
  factory :article do
    sequence :url do |n|
      "url/to/original/article#{n}"
    end
    image_url 'hogehoge'
    title 'fugafuga'
  end
end
