class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :phone, unique: true, null: false, default: ""
      t.string :password, null: false, default: ""
      t.string :name
      t.string :api_key
      t.boolean :is_admin, default: true

      t.timestamps
    end
  end
end
