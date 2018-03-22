namespace :google_news_crawler do
  desc 'Get latest 30 news with enviroment variables rake google_news_crawler :do KEYWORD=hogehoge'
  task do: :environment do
    keyword = ENV['KEYWORD']
    p keyword
    escaped_keyword = CGI.escape(keyword)
    (0..2).each do |page|
      url = "https://www.google.co.jp/search?safe=off&q=#{escaped_keyword}&tbm=nws&start=#{page * 10}"
      html = open(url).read
      doc = Nokogiri::HTML.parse(html, url)
      # TODO: 正規表現に変更する
      links = doc.css('div  div  h3  a').map { |i| i.attributes['href'].value[7..-1] }
      p links.size
      links.each do |link|
        # google analytics用のパラメータが入ってることがあるので除去する
        reg = /&/.match(link)
        url = reg.pre_match
        Article.find_or_create_article!(url)
      end
    end
  end
end
