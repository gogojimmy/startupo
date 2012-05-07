module EventsHelper

  def show_google_map(lat, lon)
    "http://maps.google.com/maps/api/staticmap?center=#{lat},#{lon}&zoom=13&markers=#{lat},#{lon}&size=640x400&sensor=false"
  end

  def link_to_google_map(lat, lon)
    "http://maps.google.com/maps?q=#{lat},+#{lon}"
  end

  def show_join_button(event, user)
    if event.attendees.include?(user)
      content_tag(:button, I18n.t('event.action.joined'), :class => 'btn btn-primary', :disabled => true)
    else
      link_to I18n.t('event.action.count_me_in'), event_join_path(@event), :method => :put, :class => 'btn btn-primary'
    end
  end

end
