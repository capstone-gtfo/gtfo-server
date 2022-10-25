class SendTextsJob < ApplicationJob
  queue_as :default
  text_count = 0 

    def perform   
        User.all.each do |user|
          location = "#{user.lat},#{user.long}"
          NWSFacade.retrieve_disaster_sms(location, user.phone)
        end    
    end

    after_perform do |job|
      if text_count <= 1
        text_count += 1
        puts text_count
        self.class.set(wait: 30.seconds).perform_later
      else 
        break 
      end 
    end
end
