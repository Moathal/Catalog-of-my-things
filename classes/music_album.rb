require_relative 'item'
require_relative 'author'
require_relative 'genre'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(genre, author,date,spotify)
    super(date)
    @on_spotify = spotify
    @genre=genre
    @author=author
  end

  def self.list_music_album(albums)
    if albums.length.zero?
        puts "\nNo Music Album found\n\n"
    else
    albums.each do |album|
      print "Genre: #{album.genre.name} Author: #{album.author.firstname}  #{album.author.lastname}"
      print "Date: #{album.publish_date} Spotify: #{album.on_spotify}\n\n"
    end
   end
  end

  private

  def can_be_archived?
    if super() && @on_spotify then true else
                                          false
    end
  end
end
