class AddTypeOfTenderToDoc1s < ActiveRecord::Migration[6.0]
  def change
    add_column :doc1s, :type_of_tender, :integer, default: 0
  end
end
