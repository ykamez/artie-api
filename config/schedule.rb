every 6.hours do
  rake "bundle exec rake google_news_crawler:do KEYWORD=仮想通貨"
  rake "bundle exec rake google_news_crawler:do KEYWORD=ブロックチェーン"
end
