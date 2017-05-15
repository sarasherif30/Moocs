class AddTitleToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :title, :string
  end
end
