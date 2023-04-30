class CreateBlogArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_articles do |t|
      t.references :blog, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
