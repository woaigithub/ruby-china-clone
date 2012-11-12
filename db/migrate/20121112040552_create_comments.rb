class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
