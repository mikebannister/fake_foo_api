class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.datetime_select(:foo, :foo_date)
      
      t.timestamps
    end
  end
end
