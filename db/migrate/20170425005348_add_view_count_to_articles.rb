class AddViewCountToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :views, :integer
  end
end
