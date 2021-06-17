class ArticlesUrlUnique < ActiveRecord::Migration[6.1]
  def change
    add_index :articles, :url, unique: true
  end
end
