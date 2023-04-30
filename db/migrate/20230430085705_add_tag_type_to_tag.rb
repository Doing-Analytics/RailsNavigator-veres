class AddTagTypeToTag < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :tag_type, :integer
  end
end
