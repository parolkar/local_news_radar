# == Schema Information
#
# Table name: radar_places
#
#  id            :integer         not null, primary key
#  place_id      :string(255)
#  name          :string(255)
#  geo_rss_point :string(255)
#  url           :string(255)
#  location_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class RadarPlace < ActiveRecord::Base  
  has_many :radar_place_mappings
  has_many :radars , :through => :radar_place_mappings 
  belongs_to :location
end
