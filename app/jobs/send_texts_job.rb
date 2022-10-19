class SendTextsJob < ApplicationJob
  queue_as :default

    def perform   
        User.all.each do |user|
          location = "#{user.lat},#{user.long}"
          NWSFacade.retrieve_disaster_sms(location, user.phone)
        end    
    end
     
    after_perform do |job|
       self.class.set(wait: 30.seconds).perform_later
    end
end
