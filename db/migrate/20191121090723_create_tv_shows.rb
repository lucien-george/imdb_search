class CreateTvShows < ActiveRecord::Migration[5.2]
  def change
    create_table :tv_shows do |t|
      t.string :title
      t.integer :year
      t.text :syllabus

      t.timestamps
    end
  end
end
