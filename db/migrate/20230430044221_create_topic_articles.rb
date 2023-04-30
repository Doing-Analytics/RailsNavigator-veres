class CreateTopicArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :topic_articles do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
