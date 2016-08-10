require 'nokogiri'
require 'anemone'
require 'kconv'

url = "http://www.amazon.co.jp/dp/B01DRX3DS2"

opts = {
    depth_limit: 0,
    :delay => 1
}

Anemone.crawl(url, opts) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)
    
    title = doc.xpath("/html/body/div[2]/div[4]/div[6]/div[1]/div/h1/span").text.strip
    price = doc.xpath("/html/body/div[2]/div[4]/div[6]/div[5]/div/table/tbody/tr[2]/td[2]/span[1]").text
    puts title + price
    puts price
  end
end


