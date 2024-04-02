class AddNameToMotherboards < ActiveRecord::Migration[7.1]
  def change
    add_column :mother_boards, :name, :string
  end
end
