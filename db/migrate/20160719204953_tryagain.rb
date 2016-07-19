class Tryagain < ActiveRecord::Migration
	def change
		create_table :events do |t| 
			t.string :title 
			t.string :image_url
			t.string :human_location
			t.string :placeid
			t.integer :cost
			t.string :description
			t.string :link
			t.date :event_date
			t.timestamps null:true
		end
	end
end
