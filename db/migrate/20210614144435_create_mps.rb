class CreateMps < ActiveRecord::Migration[6.1]
  def change
    create_table :mps do |t|
      t.string :name
      t.string :party
      t.string :constituency
      t.integer :first_elected
      t.integer :elections_won
      t.integer :majority

      t.timestamps
    end
  end
end
