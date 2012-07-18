module ApplicationHelper

  def soundcloud_frame(sc_id)
    return '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F'+sc_id+'&amp;show_artwork=false&amp;color=00abef"></iframe>'
  end

end
