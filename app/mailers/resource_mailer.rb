#encoding: utf-8
class ResourceMailer < ActionMailer::Base
  default :from => 'startupo@startupo.cc'

  def somebody_interest_it(user, resource)
    @resource = resource
    @user = user
    @mail_to = resource.assignee.email || 'kate@startupo.cc'
    mail(:to => @mail_to, :subject => "有人對 #{resource.title} 表示有興趣")
  end
end
