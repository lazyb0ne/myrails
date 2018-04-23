class AddLikingCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :liking_count, :integer, comment: "count cache"
  end
end
