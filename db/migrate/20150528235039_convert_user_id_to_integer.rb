class ConvertUserIdToInteger < ActiveRecord::Migration
  def change
    change_column :projects, :user_id, :integer
  end
end
