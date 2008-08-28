class Story < ActiveRecord::Base
  require_dependency 'date_validator'

  # validates_dates :publish_at,
  #                 :from => '1 Jan 2000',
  #                 :to => '31 Dec 2020',
  #                 :allow_nil => true
                  # Date.today seems to restrictive: someone *might* need to mark something for the past,
                  # and it is certainly useful to post in the future, although I don't *yet* wait to publish it...
                  # but the idea of the field name not being past tense is that it is FORWARD-LOOKING
end
