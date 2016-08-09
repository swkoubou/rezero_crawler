# 必要なgemを読み込み。読み込み方やその意味はrubyの基本をおさらいして下さい。
require 'nokogiri'
require 'anemone'
require 'kconv'

# 後述。
opts = {
    depth_limit: 0
}

url = []
url.push("https://www.amazon.co.jp/Re-%E3%82%BC%E3%83%AD%E3%81%8B%E3%82%89%E5%A7%8B%E3%82%81%E3%82%8B%E7%95%B0%E4%B8%96%E7%95%8C%E7%94%9F%E6%B4%BB-3-Blu-ray-%E5%B0%8F%E6%9E%97%E8%A3%95%E4%BB%8B/dp/B01DRX3F26/ref=sr_1_1?s=dvd&ie=UTF8&qid=1470745643&sr=1-1&keywords=Re%3A%E3%82%BC%E3%83%AD%E3%81%8B%E3%82%89%E5%A7%8B%E3%82%81%E3%82%8B%E7%95%B0%E4%B8%96%E7%95%8C%E7%94%9F%E6%B4%BB")

# AnemoneにクロールさせたいURLと設定を指定した上でクローラーを起動！
Anemone.crawl(url, opts) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)
      title = doc.xpath("//div[@class='centerColAlign']/div/div/h1/span").text
      price = doc.xpath("//div[@class='centerColAlign']//table/tr[2]/td[2]/span[1]").text 
      print(title.strip)
      print("\n")
      print(price)
      print("\n")      
  end # page終わり
end # Anemone終わり
