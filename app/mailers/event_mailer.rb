#encoding: utf-8
class EventMailer < ActionMailer::Base
  default :from => 'startupo@startupo.cc'

  def confirm(user, event)
    @event = event
    mail(:to => user.email, :subject => "#{event} 活動報名通知")
  end
end
