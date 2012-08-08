module UsersHelper

  def show_badge(count = 0)
    if count != 0
      content_tag(:span, count, :class => 'badge pull-right')
    end
  end

  def show_user_facebook_account(user)
    return unless user
    if user.provider? && user.uid? && user.access_token?
      render :partial => "facebook-block", :locals => { :user => user }
    else
      link_to user_omniauth_authorize_path(:facebook), :class => "btn btn-info btn-large" do
        content_tag(:i, '', :class => "icon-facebook") +
        " #{I18n.t('provider.link_facebook')}"
      end
    end
  end
end
