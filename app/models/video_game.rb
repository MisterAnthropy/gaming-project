class VideoGame < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true
end
