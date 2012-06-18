module UsersHelper

  def show_badge(count = 0)
    if count != 0
      content_tag(:span, count, :class => 'badge badge-error unconfirmed_users_count')
    end
  end
end
