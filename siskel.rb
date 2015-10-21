require 'httparty'

class Siskel
  attr_reader :title, :rating, :year, :plot, :metascore, :consensus

  def initialize(title, options={})  #same as year={}
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{options[:year]}&plot=#{options[:plot]}")
    @title = @movie['Title']
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
    @metascore = @movie['Metascore']
  end

  def title
    if @title == nil
      @title = "Movie not found!"
    else
      @title
    end
  end

  def consensus
    if @metascore.to_i >= 51
      @consensus = "Thumbs Up"
    else
      @consensus = "Thumbs Down"
    end
  end
end
