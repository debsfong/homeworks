class CreatePersonsTable < ActiveRecord::Migration
  def change
    create_table :persons_tables do |t|
      t.string :name, null: false
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end
