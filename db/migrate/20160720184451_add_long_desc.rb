class AddLongDesc < ActiveRecord::Migration
  def change
  	add_column :events, :long_desc, :string
  end
end
