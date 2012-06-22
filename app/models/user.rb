class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :soundcloud_id, :permalink, :permalink_url, :avatar_url, :city, :country, :track_count,
                  :username, :website, :token
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :omniauthable, :omniauth_providers => [:soundcloud]
  
  def self.find_for_soundcloud_oauth(access_token, signed_in_resource=nil)
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
end
