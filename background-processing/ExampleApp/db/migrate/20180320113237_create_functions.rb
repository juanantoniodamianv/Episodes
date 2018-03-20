class CreateFunctions < ActiveRecord::Migration[5.0]
  def change
    create_table :functions do |t|
      t.string :name
      t.date :date_entry
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
