class CreateDoc1s < ActiveRecord::Migration[6.0]
  def change
    create_table :doc1s do |t|
      t.references :tender,		null: false,	foreign_key: true
      t.string :debit_head,		null: false,	default: ""
      t.string :item_name,		null: false,	default: ""
      t.integer :quantity,		null: false,	default: 0
      t.integer :estimated_cost,null: false,	default: 0
      t.integer	:status,		null: false,	default: 0
      t.string 	:type,			null: false,	default: 3
      t.timestamps
    end
  end
end
