require 'nokogiri'
require 'anemone'
require 'kconv'

class AmazonCrawler
　def initialize(url)
    @url = url
    opts = {
        depth_limit: 0
    }
    Anemone.crawl(@url, opts) do |anemone|
      anemone.on_every_page do |page|
        @doc = Nokogiri::HTML.parse(page.body.toutf8)
      end
    end	
  end

  def name()
    name = @doc.xpath("//div[@class='centerColAlign']/div/div/h1/span").text.strip
    return name
  end

  def price()
    price = @doc.xpath("//div[@class='centerColAlign']//table/tr[2]/td[2]/span[1]").text.strip.delete("¥ ,").to_i
    return price
  end
end
