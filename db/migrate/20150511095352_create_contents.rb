class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.string :content_type
      t.text :content
      t.attachment :image
      t.string :slug
      t.boolean :published
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :contents, :users
  end
end
