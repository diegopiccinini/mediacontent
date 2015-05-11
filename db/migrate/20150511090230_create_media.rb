class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.string :content_type
      t.text :content
      t.attachment :image
      t.string :slug
      t.boolean :share

      t.timestamps null: false
    end
  end
end
