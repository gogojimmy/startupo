module UsersHelper

  def show_badge(count = 0)
    if count != 0
      content_tag(:span, count, :class => 'badge pull-right')
    end
  end
end
