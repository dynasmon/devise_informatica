class CreateComputers < ActiveRecord::Migration[7.1]
  def change
    create_table :computers do |t|
      t.references :client, null: false, foreign_key: true
      t.references :processor, null: false, foreign_key: true
      t.references :mother_board, null: false, foreign_key: true
      t.references :video_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
