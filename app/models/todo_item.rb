class TodoItem < ActiveRecord::Base
  belongs_to :destination
  geocoded_by :geocoder_input, latitude: :lat, longitude: :lng
  after_validation :geocode, if: ->(obj){ obj.geocoder_input.present? }#  and obj.geocoder_input.changed? } 
  
  def self.fields
    columns.map(&:name) - ["id", "created_at", "updated_at", "destination", 
			   "destination_id", "lng", "lat"]
  end

  def geocoder_input
    "#{location}, #{destination.name}" unless !location.present?
  end

end
