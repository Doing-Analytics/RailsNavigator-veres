class AddHighlightedAndShowInDashboard < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :introduce, :string
  end
end
