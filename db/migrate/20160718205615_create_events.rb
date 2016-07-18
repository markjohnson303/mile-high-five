class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t| #t stands for table
      t.string :title #add a name attribute of type string to the table
      t.string :image_url #also add a photo_url attribute of type string
      t.string :Location # finally add a nationality attribute of type string
      t.string :description
      t.string :link
      t.boolean :time_sensitive
      t.date :event_date
      t.time :event_time
      t.timestamps null:true #this will add timestamps for time created and time updated automagically!
    end
  end
end