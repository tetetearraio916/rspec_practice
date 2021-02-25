class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 30
      t.integer :age
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
