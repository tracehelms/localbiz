class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.references :user
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
