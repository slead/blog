class AddSlugsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :slug, :string
  end
end
