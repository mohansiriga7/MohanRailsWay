class Player < ActiveRecord::Base
  belongs_to :myteam, class_name: "Team", foreign_key: "team_id", inverse_of: :team_players
end
