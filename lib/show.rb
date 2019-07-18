class Show
  attr_reader :id, :title, :year, :country, :genres, :rate

  def initialize(params)
    @id = params[:id]
    @title = params[:title]
    @year = params[:year]
    @country = params[:country]
    @genres = params[:genres]
    @rate = params[:rate]
  end

  def to_s
    <<~TEXT
      #{title} (#{year})
      #{genres.join(', ').capitalize}
      #{country}, Рейтинг: #{rate}
    TEXT
  end
end
