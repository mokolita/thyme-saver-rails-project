class Reminder < ApplicationRecord
    belongs_to :instruction
    

    def format_reminder
        user_date = self.created_at.to_a 
        reminder_time = user_date[3] + self.interval
        reminder_due =  


        if start_time < end_time 
             "until you need to #{self.comment}."
        elsif start_time = end_time 
            "You need to #{self.comment} today!"
        else start_time > end_time 
            "#{self.comment}" + "ing is overdue!"

        end 
    end 
end