class RemoveTypeFromDoc1s < ActiveRecord::Migration[6.0]
  def change
    remove_column :doc1s, :type, :string
  end
end
