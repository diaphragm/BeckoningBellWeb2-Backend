class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :user
      t.text :body
      t.references :bell, null: false, foreign_key: true

      t.timestamps
    end
  end
end
