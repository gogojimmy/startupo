#encoding: utf-8
class ResourceMailer < ActionMailer::Base
  default :from => 'startupo@startupo.cc'

  def somebody_interest_it(user, resource)
    @resource = resource
    @user = user
    if @resource.assignee
      @mail_to = resource.assignee
    else
      @mail_to = "kate@startupo.cc"
    end
    mail(:to => 'jimmy@gogojimmy.net', :subject => "有人對 #{resource.title} 表示有興趣")
  end
end
