class AddRatingToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :rating, :integer    # adds a column to albums, called rating, which is an integer
  end                                       # must run rails db:migrate to activate
end
