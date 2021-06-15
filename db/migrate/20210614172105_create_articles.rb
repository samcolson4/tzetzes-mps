class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :headline
      t.datetime :datetime
      t.string :url
      t.string :tag
      t.text :article_text
      t.references :mp, null: false, foreign_key: true

      t.timestamps
    end
  end
end
