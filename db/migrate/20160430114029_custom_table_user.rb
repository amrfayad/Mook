class CustomTableUser < ActiveRecord::Migration
  def change
    add_column :users , :dob , :date
    add_column :users , :name , :string
    add_column :users , :gender , :boolean
    add_column :users , :img , :string
    add_column :users , :is_student , :boolean
    
  end
end
