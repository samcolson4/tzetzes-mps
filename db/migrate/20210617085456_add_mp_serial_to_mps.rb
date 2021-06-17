class AddMpSerialToMps < ActiveRecord::Migration[6.1]
  def change
    add_column :mps, :mp_serial, :int4
  end
end
