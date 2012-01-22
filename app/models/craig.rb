class Craig

  def initialize
  end

  def self.fetch url
    doc = Nokogiri::HTML(open(url))
  end

  def self.homepage slug = 'portland'
    doc = self.fetch("http://#{slug}.craigslist.org")

    city = doc.css('div#topban').children.css('h2').text
    categories = doc.css('table#main').children.css('div.col')

    {
      :city => city,
      :categories => categories
    }
  end

  def self.section city, slug
    doc = self.fetch("http://#{city}.craigslist.org/#{slug}/")

    list = doc.css('blockquote').children.css('p')

    {
      :city => city,
      :list => list
    }
  end

  def self.single slug
    # Fetch single listing
  end

end