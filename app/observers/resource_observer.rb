class ResourceObserver < ActiveRecord::Observer
  observe :resource

  def after_create(resource)
    resource.comments.create(:user => resource.user,
                             :content => I18n.t('resource.comment.create'))
  end
end
