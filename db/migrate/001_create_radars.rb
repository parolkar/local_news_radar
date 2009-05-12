class CreateRadars < ActiveRecord::Migration
  def self.up
    create_table :radars do |t|
        t.string :item_id
        t.string :item_type
        t.string :icon_path
        t.string :author
        t.string :author_url   
        t.datetime :published_at 
        t.text :title
        t.text :body
        t.string :url 
        t.timestamps
    end
  end

  def self.down
    drop_table :radars
  end
end
