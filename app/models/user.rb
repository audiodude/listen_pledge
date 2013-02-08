class User < ActiveRecord::Base
  has_many :songs

  # Setup accessible (or protected) attributes for your model
  attr_accessible :soundcloud_id, :permalink, :permalink_url, :avatar_url, :city, :country, :track_count,
                  :username, :website, :token
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :omniauthable, :omniauth_providers => [:soundcloud]

  # validates :email, :email_format => {:message => 'does not appear to be a valid email address.'}
  
  def self.find_for_soundcloud_oauth(access_token)
    extra = access_token.extra.raw_info
    if user = User.where(:soundcloud_id => extra.id).first
      user
    else
      User.new(
        :soundcloud_id => extra.id,
        :permalink => extra.permalink,
        :permalink_url => extra.permalink_url,
        :avatar_url => extra.avatar_url,
        :city => extra.city,
        :country => extra.country,
        :track_count => extra.track_count,
        :username => extra.username,
        :website => extra.website,
        :token => access_token.credentials.token
      )
    end
  end
  
  # This method is called by devise before it creates the User. Here we can check if the user was signed up
  # based on a soundcloud registration, and store their soundcloud data in the db
  def self.new_with_session(params, session)
    super.tap do |user|
      # if data = session["devise.soundcloud_data"] && session["devise.soundcloud_data"]["extra"]["user_hash"]
      #   user.email = data["email"]
      # end
    end
  end

  def seen_song_ids
    all_song_pairings = self.songs.collect {|s| s.to_pairings + s.from_pairings }.flatten.compact
    all_song_pairings.collect {|p| [p.to_song_id, p.from_song_id] }.flatten.uniq
  end

  def find_eligible_song(my_song)
    potential = Song.where('user_id != ? AND eligible = 1 AND id NOT IN (?)', self.id, self.seen_song_ids.join(',')).order('updated_at')
    return potential.first if my_song.new_record? 
    potential.each do |s|
      return s unless s.user.seen_song_ids.include?(my_song.id)
    end
    return nil
  end
end
