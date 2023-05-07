class AddSeqToTag < ActiveRecord::Migration[7.0]
  def change
    add_column :topic_tags, :position, :integer
  end
end
