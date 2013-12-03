class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :reviewable, polymorphic: true
      t.belongs_to :user
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
