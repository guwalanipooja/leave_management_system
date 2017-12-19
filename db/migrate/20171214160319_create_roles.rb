class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    create_table :roles_users do |t|
      t.belongs_to :role, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
