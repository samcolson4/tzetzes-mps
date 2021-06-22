class AddSlugToMps < ActiveRecord::Migration[6.1]
  def change
    add_column :mps, :slug, :string
    add_index :mps, :slug, unique: true
  end
end
