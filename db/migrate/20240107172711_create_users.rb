class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :token

      t.timestamps
    end
  end
end
