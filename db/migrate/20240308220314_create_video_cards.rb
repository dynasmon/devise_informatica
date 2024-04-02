class CreateVideoCards < ActiveRecord::Migration[7.1]
  def change
    create_table :video_cards do |t|
      t.string :name

      t.timestamps
    end
  end
end
