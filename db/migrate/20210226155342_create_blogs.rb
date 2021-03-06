class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title, null: false, limit: 20
      t.text :content, null: false, limit: 100
      t.integer :read, null: false, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
