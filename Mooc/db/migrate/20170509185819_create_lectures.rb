class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.text :content
      t.string :attachment

      t.timestamps null: false
    end
  end
end
