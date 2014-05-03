class CreateNewspapers < ActiveRecord::Migration
  def change
    create_table :newspapers do |t|
      t.string :name
      t.date :founded_at
      t.string :description
    end
  end
end
