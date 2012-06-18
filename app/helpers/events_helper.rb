module EventsHelper

  def show_google_map(lat, lon)
    "http://maps.google.com/maps/api/staticmap?center=#{lat},#{lon}&zoom=13&markers=#{lat},#{lon}&size=300x300&sensor=false"
  end

  def link_to_google_map(lat, lon)
    "http://maps.google.com/maps?q=#{lat},+#{lon}"
  end

  def show_join_button(event, user)
    if event.attendees.include?(user)
      content_tag(:button, I18n.t('event.action.joined'), :class => 'btn btn-danger btn-large', :disabled => true, :style => 'width: 100%')
    else
      link_to I18n.t('event.action.count_me_in'), event_join_path(@event), :method => :put, :class => 'btn btn-primary btn-large'
    end
  end

end
