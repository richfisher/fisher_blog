class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content, :limit => 64.kilobytes + 1
      t.integer :category_id
      t.text :tags

      t.timestamps
    end
  end
end
