class RemoveRolesFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :roles, :string
  end
end
