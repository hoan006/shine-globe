class Record < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :point, :step, :timestamp
end
