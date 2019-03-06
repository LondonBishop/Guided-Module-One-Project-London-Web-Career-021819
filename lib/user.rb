class User < ActiveRecord::Base

    has_many :games

    def get_all_games
        User.all.select {|user| user.id == self}
    end

end
