module ResourcesHelper

  def show_want_button(resource, user)
    if resource.matchers.include?(user)
      button_to I18n.t('resource.already_wanted'),
                  resource_i_want_it_path(resource), :class => 'btn',
                  :disabled => true
    else
      link_to resource_i_want_it_path(resource),
              :class => 'btn btn-danger btn-large i-want-it',
              :method => :put do
                tag("span", :class => 'icon-ok')
                I18n.t('resource.i_want_it')
              end
    end
  end

end
