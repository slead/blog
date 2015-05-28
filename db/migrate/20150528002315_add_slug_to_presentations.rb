class AddSlugToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :slug, :string
  end
end
