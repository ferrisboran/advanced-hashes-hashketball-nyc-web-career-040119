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
			}, "Bismak Biyombo" => {
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
				#return "#{players_name} scored #{data[:points]} points."
				return data[:points]
			end
		end
	end
end

def shoe_size(players_name)
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			if att == players_name
				#return "#{players_name}'s shoe size is #{data[:shoe]}."
				return data[:shoe]
			end
		end
	end
end

def team_colors(team_name)
	game_hash.each do |loc, team_data|
		if team_data[:team_name] == team_name
			#return "#{team_name}'s colors are #{team_data[:colors].join(' & ')}."
			return team_data[:colors]
		end
	end
end

def team_names
	team_name = []
	@team1 = {}
	@team2 = {}
	game_hash.each do |loc, team_data|
		team_name << team_data[:team_name]
	end
	@team1 = team_name[0]
	@team2 = team_name[1]
	#return "The two teams are #{team_name.join(' & ')}."
	return team_name
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
	#return "The jersey numbers for #{team_name} are #{jerseys.join(', ')}."
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
	stat_string = []
	stats.each do |key, value|
		stat_string << "#{key}: #{value}"
	end
	#return "#{players_name}'s stats are #{stat_string.join(', ')}."
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
				#return "#{att} has the biggest shoe at size #{data[:shoe]}, and had #{data[:rebounds]} rebounds."
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
	#return "#{player} scored the most with #{most_points[-1]} points."
	return player
end

def winning_team
	team1 = 0
	team2 = 0
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			team_data[:team_name] == @team1 ? team1 += data[:points] : team2 += data[:points]
		end
	end
	#return team1 > team2 ? "#{@team1} won with #{team1} points. #{@team2} only scored #{team2} points." : "#{@team2} won with #{team2} points. #{@team1} only scored #{team1} points."
	return team1 > team2 ? @team1 : @team2
end

def player_with_longest_name
	names = []
	@long_name = {}
	game_hash.each do |loc, team_data|
		team_data[:players].each do |att, data|
			names << att.size
		end
		names.sort!
		team_data[:players].each do |players_name, data|
			if names[-1] == players_name.size
				@long_name = players_name.clone
			end
		end
	end
	#return "The player with the longest name today is #{@long_name}."
	return @long_name
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
			if @long_name == att
				long_name_steals = data[:steals]
			end
		end
	end
	#print "Did #{@long_name} have the most steals? "
	#print most_steals[-1] == long_name_steals ? "Yes, with #{long_name_steals}." : "No; #{@long_name} only had #{long_name_steals}."
	most_steals[-1] == long_name_steals ? true : false
end
