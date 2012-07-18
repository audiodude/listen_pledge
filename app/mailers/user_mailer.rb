class UserMailer < ActionMailer::Base
  default :from => 'admin@listenpledge.com'

  def pairing_ready_email(user, pairing)
    @user = user
    @pairing = pairing
    @user_song, @other_song = pairing.user_song(user)
    mail(:to => user.email, :subject => "You have been paired on Listen Pledge")
  end

end
