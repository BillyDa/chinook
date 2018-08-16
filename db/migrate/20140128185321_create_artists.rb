class CreateArtists < ActiveRecord::Migration

                          # change is a special method, MUST have this method
  def change
    create_table :artists do |t|
      t.string :name

      t.timestamps
    end
  end
end
