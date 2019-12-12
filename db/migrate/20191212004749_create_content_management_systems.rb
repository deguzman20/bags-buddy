class CreateContentManagementSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :content_management_systems do |t|

      t.timestamps
    end
  end
end
