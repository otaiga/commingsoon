class CreateMovieData < ActiveRecord::Migration
  def change
    create_table :movie_data do |t|

      t.date :release_date
      t.string :title_id
      t.string :name
      t.string :bio
      t.text :cast
      t.string :image_link

      t.timestamps
    end
  end
end
