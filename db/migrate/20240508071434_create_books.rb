class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :name
      t.date :release_date
      t.integer :author_id
      
      t.timestamps
    end
  end
end
