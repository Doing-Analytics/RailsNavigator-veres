class AddHighlightToTopic < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :highlighted, :boolean
  end
end
