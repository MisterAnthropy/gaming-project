class User < ActiveRecord::Base
    has_secure_password

    has_many :video_games
end
