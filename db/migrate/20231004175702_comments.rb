# comments migration
class Comments < ActiveRecord::Migration[7.0]
  def change
    create_table :commnets do |t|
      t.references :user_id, foreign_key: { to_table: :users }
      t.references :post_id, foreign_key: { to_table: :posts }
      t.text :text
      t.timestamps
    end
  end
end
