class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :omniauthable, :omniauth_providers => [:soundcloud]
  
  def self.find_for_soundcloud_oauth(access_token, signed_in_resource=nil)
    extra = access_token.extra.raw_info
    logger.debug access_token.inspect
    logger.debug accest_token.extra
    if user = User.where(:soundcloud_id => access_token.extra.id).first
      user
    else
      User.create!(
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
