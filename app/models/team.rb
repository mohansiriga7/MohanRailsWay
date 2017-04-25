class Team < ActiveRecord::Base
  has_many :team_players, class_name: "Player", foreign_key: :team_id, inverse_of: :myteam
end
