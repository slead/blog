class AddAttributesToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :title, :string
    add_column :presentations, :description, :text
    add_column :presentations, :url, :string
  end
end
