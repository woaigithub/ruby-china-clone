class CreateTopics < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.string   :title
      t.text     :content

      t.timestamps
    end
  end

  def down
    drop_table :topics
  end
end
