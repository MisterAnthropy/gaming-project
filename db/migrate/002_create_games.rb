class CreateGames < ActiveRecord::Migration
    def change
        create_table :video_games do |t|
            t.string :title
            t.integer :user_id
            t.timestamps null: false
        end
    end
end
