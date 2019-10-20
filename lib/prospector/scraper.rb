class Prospector::Scraper

  def scrape_page
    doc = Nokogiri::HTML(open("http://www.billboard.com/charts/hot-100"))
  end

  def scrape_songs
    self.scrape_page.css("article.chart-row")
  end

  def make_songs
    scrape_songs.each do |content|
      Prospector::Song.new(
      "http://www.billboard.com/charts/hot-100",
      content.css("h2.chart-row__song").text,
      content.css("div.chart-row__container > div > span.chart-row__artist", "div.chart-row__container > div > a.chart-row__artist").text.split(" ").join(" "),
      content.css("span.chart-row__current-week").text,
      content.css("div.chart-row__last-week > span.chart-row__value").text.split,
      content.css("div.chart-row__top-spot > span.chart-row__value").text.split,
      content.css("div.chart-row__weeks-on-chart > span.chart-row__value").text.split
      )
    end
  end
end
