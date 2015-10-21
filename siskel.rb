require 'httparty'

class Siskel
  attr_reader :title, :rating, :year, :plot

  def initialize(title, options={})  #same as year={}
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{options[:year]}&plot=#{options[:plot]}")
    @title = @movie['Title']
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
  end

  def title
    if @title == nil
      @title = "Movie not found!"
    else
      @title
    end
  end
end
