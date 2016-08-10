require 'nokogiri'
require 'anemone'
require 'kkonv'

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

  def Name()
    @name = @doc.xpath("//div[@class='centerColAlign']/div/div/h1/span").text
  end

  def Price()
    @price = @doc.xpath(("//div[@class='centerColAlign']//table/tr[2]/td[2]/span[1]").text
  end
end

