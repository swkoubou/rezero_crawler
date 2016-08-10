require 'nokogiri'
require 'anemone'
require 'kconv'

url = []
url.push("http://www.amazon.co.jp/dp/B01DRX3BOS")

opts = {
    depth_limit: 0
}

Anemone.crawl(url, opts) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)
      title = doc.xpath("//div[@class='centerColAlign']/div/div/h1/span").text
      price = doc.xpath("//div[@class='centerColAlign']//table/tr[2]/td[2]/span[1]").text 
      print(title.strip)
      print("\n")
      print(price.delete("¥ "))
      print("\n")
  end
end


