class Removetimestampfrombooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :created_at, :datetime
    remove_column :books, :updated_at, :datetime
  end
end
