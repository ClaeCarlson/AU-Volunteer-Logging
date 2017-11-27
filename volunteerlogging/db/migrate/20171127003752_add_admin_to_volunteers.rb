class AddAdminToVolunteers < ActiveRecord::Migration[5.1]
  def change
    add_column :volunteers, :admin, :boolean, default: false
  end
end
