class CreateDoc2s < ActiveRecord::Migration[6.0]
  def change
    create_table :doc2s do |t|
      t.references :tender, null: false, foreign_key: true
      t.string :debit_head
      t.string :item_name
      t.string :type
      t.integer :quantity
      t.integer :estimated_cost
      t.date :date
      t.time :time
      t.string :venue

      t.timestamps
    end
  end
end
