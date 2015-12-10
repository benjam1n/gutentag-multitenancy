class AlterTags < ActiveRecord::Migration
  def up
    add_column :gutentag_tags, :tenant_id, :integer, null: false

    remove_index :gutentag_tags, :name
    add_index :gutentag_tags, [:name, :tenant_id], unique: true
  end

  def down
    remove_index :gutentag_tags, [:name, :tenant_id]
    add_index :gutentag_tags, :name, unique: true

    remove_column :gutentag_tags, :tenant_id
  end
end
