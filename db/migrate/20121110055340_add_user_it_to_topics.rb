class AddUserItToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :user_id, :integer
  end
end
