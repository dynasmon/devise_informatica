class CreateMotherboards < ActiveRecord::Migration[7.1]
  def change
    create_table :motherboards do |t|
      t.boolean :supports_intel
      t.boolean :supports_amd
      t.boolean :integrated_video
      t.integer :number_of_slots
      t.references :video_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
