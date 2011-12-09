class User < ActiveRecord::Base
  has_many :friendships
  has_one :avail
  has_many :friends, :through => :friendships
  accepts_nested_attributes_for :avail
  
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
