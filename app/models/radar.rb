# == Schema Information
#
# Table name: radars
#
#  id           :integer         not null, primary key
#  item_id      :string(255)
#  item_type    :string(255)
#  icon_path    :string(255)
#  author       :string(255)
#  author_url   :string(255)
#  published_at :datetime
#  title        :text
#  body         :text
#  url          :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Radar < ActiveRecord::Base  
  has_many :radar_place_mappings
  has_many :radar_places , :through => :radar_place_mappings
end
