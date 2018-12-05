class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.text :introduction
      t.text :body
      t.date :date
      t.references :article_category, foreign_key: true

      t.timestamps
    end
  end
end
