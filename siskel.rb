require 'httparty'

class Siskel
  attr_reader :title, :rating, :year, :plot, :tomato, :consensus

  def initialize(title, options={})  #same as year={}
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{options[:year]}&plot=#{options[:plot]}&tomatoes=true")
    @title = @movie['Title']
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
    @tomato = @movie['tomatoUserMeter']
  end

  def title
    if @title == nil
      @title = "Movie not found!"
    else
      @title
    end
  end

  def consensus
    if @tomato.to_i > 50
      @consensus = "Thumbs Up"
    elsif @tomato.to_i < 50
      @consensus = "Thumbs Down"
    end
  end
end
