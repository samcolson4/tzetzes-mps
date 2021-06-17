class AddUrlsToMps < ActiveRecord::Migration[6.1]
  def change
    add_column :mps, :mp_parliament_url, :string
    add_column :mps, :mp_website_url, :string
  end
end
