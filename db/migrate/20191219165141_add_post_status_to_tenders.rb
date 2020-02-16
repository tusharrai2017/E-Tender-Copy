class AddPostStatusToTenders < ActiveRecord::Migration[6.0]
  def change
    add_column :tenders, :status, :integer, default: 0
  end
end
