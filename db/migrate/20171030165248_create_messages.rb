class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :message_card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
