class MoveRatingToArtist < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :rating, :integer
    add_column :artist, :rating, :integer
  end
end
#take effect by running rails db:migrate
