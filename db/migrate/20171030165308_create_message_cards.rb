class CreateMessageCards < ActiveRecord::Migration
  def change
    create_table :message_cards do |t|
      t.string :name
      t.string :photo

      t.timestamps null: false
    end
  end
end
