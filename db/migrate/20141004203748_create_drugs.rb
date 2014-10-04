class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :name_key
      t.string :company
      t.string :phase
      t.datetime :last_modified
      t.datetime :change_date
      t.datetime :added_date

      t.timestamps
    end
  end
end
