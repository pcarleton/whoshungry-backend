class FoodTime < ActiveRecord::Base
  belongs_to :user
  validates :start, :uniqueness => {:scope => [:user_id, :end, :dow]}
  
  def int_to_time(input)
    mins = "%02d" % (input % 60)
    hours = input / 60
    if hours > 12
      return "#{hours-12}:#{mins}pm"
    else
      return "#{hours}:#{mins}am"
    end
  end
  
  def start_time
    int_to_time(self.start)
  end
  
  def end_time
    int_to_time(self.end)
  end
end
