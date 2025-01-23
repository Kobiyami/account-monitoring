class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.decimal :amount
      t.string :entry_type
      t.references :subcategory, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
