class CreateCredentials < ActiveRecord::Migration[7.0]
  def change
    create_table :credentials do |t|
      t.text :website
      t.string :username
      t.string :password
      t.belongs_to :user

      t.timestamps
    end
  end
end
