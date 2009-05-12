class CreateRadarPlaceMappings < ActiveRecord::Migration
  def self.up
    create_table :radar_place_mappings do |t|
      t.integer :radar_id
      t.integer :radar_place_id
      t.timestamps
    end
  end

  def self.down
    drop_table :radar_place_mappings
  end
end
