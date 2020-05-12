class ChangeMicropostsUserIdNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :microposts, :user_id, :bigint, null: false
  end

  def down
    change_column :microposts, :user_id, :bigint
  end
end
