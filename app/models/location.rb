# == Schema Information
#
# Table name: locations
#
#  id         :integer         not null, primary key
#  lat        :decimal(15, 10)
#  lng        :decimal(15, 10)
#  address    :text
#  city       :string(255)
#  state      :string(255)
#  country    :string(255)
#  pincode    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base     
  has_one :radar_place
end
