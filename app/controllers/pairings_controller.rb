class PairingsController < ApplicationController

  def comment
    @pairing = Pairing.find(params[:id])
    if !@pairing
      render :nothing => true, :status => 404
    end

    if @pairing.to_song.user.id.to_s == params[:user_id]
      @pairing.to_listened = Time.now
      @pairing.to_comment = params[:comment]
      if @pairing.from_listened
        @pairing.active = false
      end
    else
      @pairing.from_listened = Time.now
      @pairing.from_comment = params[:comment]
      if @pairing.to_listened
        @pairing.active = false
      end
    end
    @pairing.save!
    render :nothing => true
  end
end
