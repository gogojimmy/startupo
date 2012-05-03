module ResourcesHelper

  def show_want_button(resource, user)
    if resource.matchers.include?(user)
      button_to I18n.t('resource.already_wanted'),
                  resource_i_want_it_path(resource), :class => 'btn',
                  :disabled => true
    else
      link_to I18n.t('resource.i_want_it'),
                  resource_i_want_it_path(resource), :class => 'btn',
                  :method => :put
    end
  end

end
