# == Schema Information
#
# Table name: radar_place_mappings
#
#  id             :integer         not null, primary key
#  radar_id       :integer
#  radar_place_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class RadarPlaceMapping < ActiveRecord::Base  
   belongs_to :radar 
   belongs_to :radar_place
end
