class User < ActiveRecord::Base
  has_many :friendships
  has_many :food_times
  has_many :friends, :through => :friendships
  accepts_nested_attributes_for :food_times,  :allow_destroy => true
  
=begin
  def to_json
    super(:include => { :avail => {:include => {
                                  :food_times => {
                                  :only => [:dow, :start, :end] 
                                  }
                                },
                        :only => {}
      }#, :friends =>  {}
    })
  end
=end
end
