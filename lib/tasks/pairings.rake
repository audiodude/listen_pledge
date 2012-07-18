
namespace :pairings do
  desc "Pair up up to 500 eligible songs"
  task :create => :environment do
    songs = Song.where(:eligible => true).limit(500)

    first_half = songs[0...songs.length/2]
    second_half = songs[songs.length/2..-1]
    
    first_half.each_with_index do |song, i|
      p = Pairing.new
      p.from_song = song
      p.to_song = second_half[i]
      p.save!
      song.eligible = false
      song.save!
      second_half[i].eligible = false
      second_half[i].save!
    end
  end
end
