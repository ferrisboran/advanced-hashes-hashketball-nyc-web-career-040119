require 'pry'
def game_hash
	game_hash = {
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black", "white"],
			:players => {"Alan Anderson" => {
				:number => 0,
				:shoe => 16,
				:points => 22,
				:rebounds => 12,
				:assists => 12,
				:steals => 3,
				:blocks => 1,
				:slam_dunks => 1
			}, "Reggie Evans" => {
				:number => 30,
				:shoe => 14,
				:points => 12,
				:rebounds => 12,
				:assists => 12,
				:steals => 12,
				:blocks => 12,
				:slam_dunks => 7 
			}, "Brook Lopez" => {
				:number => 11,
				:shoe => 17,
				:points => 17,
				:rebounds => 19,
				:assists => 10,
				:steals => 3,
				:blocks => 1,
				:slam_dunks => 15
			}, "Mason Plumlee" => {
				:number => 1,
				:shoe => 19,
				:points => 26,
				:rebounds => 12,
				:assists => 6,
				:steals => 3,
				:blocks => 8,
				:slam_dunks => 5 
			}, "Jason Terry" => {
				:number => 31,
				:shoe => 15,
				:points => 19,
				:rebounds => 2,
				:assists => 2,
				:steals => 4,
				:blocks => 11,
				:slam_dunks => 1 
				}
			}
		},
		:away => { 
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => {"Jeff Adrien" => {
				:number => 4,
				:shoe => 18,
				:points => 10,
				:rebounds => 1,
				:assists => 1,
				:steals => 2,
				:blocks => 7,
				:slam_dunks => 2 
			}, "Bismark Biyombo" => {
				:number => 0,
				:shoe => 16,
				:points => 12,
				:rebounds => 4,
				:assists => 7,
				:steals => 7,
				:blocks => 15,
				:slam_dunks => 10 
			}, "DeSagna Diop" => {
				:number => 2,
				:shoe => 14,
				:points => 24,
				:rebounds => 12,
				:assists => 12,
				:steals => 4,
				:blocks => 5,
				:slam_dunks => 5 
			}, "Ben Gordon" => {
				:number => 8,
				:shoe => 15,
				:points => 33,
				:rebounds => 3,
				:assists => 2,
				:steals => 1,
				:blocks => 1,
				:slam_dunks => 0 
			}, "Brendan Haywood" => {
				:number => 33,
				:shoe => 15,
				:points => 6,
				:rebounds => 12,
				:assists => 12,
				:steals => 22,
				:blocks => 5,
				:slam_dunks => 12 
				}
			}
		}
	}
end

def num_points_scored(players_name)
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			if att == players_name
				return data[:points]
			end
		end
	end
end

def shoe_size(players_name)
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			if att == players_name
				return data[:shoe]
			end
		end
	end
end

def team_colors(team_name)
	game_hash.each do |loc, team_data|
		if team_data[:team_name] == team_name
			return team_data[:colors]
		end
	end
end

def player_numbers(team_name)
	jerseys = []
	game_hash.each do |loc, team_data|
		if team_data[:team_name] == team_name
			team_data[:players].each do |name, num|
				jerseys << num[:number]
			end
		end
	end
	return jerseys
end

def player_stats(players_name)
	stats = {}
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			if att == players_name
				stats = data.clone
			end
		end
	end
	return stats
end

def big_shoe_rebounds
	biggest_shoe = []
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			biggest_shoe << data[:shoe]
		end
		biggest_shoe.sort!
		team_data[:players].each do |att, data|
			if biggest_shoe[-1] == data[:shoe]
				return data[:rebounds]
			end
		end
	end
end

def most_points_scored
	most_points = []
	player = {}
	game_hash.each do |loc, team_data|
		team_data[:players].each do |players_name, data|
			most_points << data[:points]
		end
		most_points.sort!
		team_data[:players].each do |players_name, data|
			if most_points[-1] == data[:points]
				player = players_name.clone
			end
		end
	end
	return player
end

def winning_team
	brooklyn_nets = 0
	charlotte_hornets = 0
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			team_data[:team_name] == "Brooklyn Nets" ? brooklyn_nets += data[:points] : charlotte_hornets += data[:points]
		end
	end
	brooklyn_nets > charlotte_hornets ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
	names = []
	long_name = {}
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			names << att.size
		end
		names.sort!
		team_data[:players].each do |players_name, data|
			if names[-1] == players_name.size
				long_name = players_name.clone
			end
		end
	end
	return long_name
end

def long_name_steals_a_ton
	most_steals = []
	long_name_steals = []
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			most_steals << data[:steals]
		end
		most_steals.sort!
		team_data[:players].each do |att, data|
			if player_with_longest_name == att
				long_name_steals << data[:steals]
			end
		end
	end
	most_steals[-1] = long_name_steals ? true : false
end

=begin
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

good_practices
=end








