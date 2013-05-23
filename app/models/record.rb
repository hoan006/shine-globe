class Record < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :serial, :point, :step, :timestamp
end
