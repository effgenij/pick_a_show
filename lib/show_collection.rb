require 'nokogiri'
require 'open-uri'

class ShowCollection
  #attr_reader :shows

  def self.from_url(url)
    shows = []
    doc = Nokogiri::HTML(open(url))
    doc.css('.js-film-list-item').each do |show|
      id = show['id'].split('_').last
      title = show.css('td.news div a.all').text.split('  ').first
      year_string = show.css('td.news div span').text
      year = year_string[/\((.*?)\)/].gsub('(', '').gsub(')', '')
      country_and_genre = show.css('td.news span.gray_text').text
      country = country_and_genre.split(/[,|.]/).first.strip
      genres = country_and_genre[/\((.*?)\)/].gsub('(', '').gsub(')', '').gsub(' ', '').split(/[,|.]/)
      rate = show.css('td div.ratingBlock span.all').text.split(' ').first

      shows << Show.new(
        id: id,
        title: title,
        year: year,
        country: country,
        genres: genres,
        rate: rate
      )
    end

    new(shows)
  end

  def initialize(shows)
    @shows = shows
  end

  def uniq_genres
    uniq_genres = []
    @shows.map do |show|
      show.genres.map do |genre|
        uniq_genres << genre
        uniq_genres.uniq!
      end
    end
    uniq_genres
  end

  def get_sample_show(by_genre)
    choiced_show = []
    @shows.map do |show|
      choiced_show << show if show.genres.include?(by_genre)
    end
    choiced_show.sample
  end
end
