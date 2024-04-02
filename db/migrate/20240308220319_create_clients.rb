class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|

      t.timestamps
    end
  end
end
