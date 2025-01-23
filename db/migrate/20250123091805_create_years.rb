class CreateYears < ActiveRecord::Migration[7.1]
  def change
    create_table :years do |t|
      t.integer :year
      t.boolean :archived

      t.timestamps
    end
  end
end
