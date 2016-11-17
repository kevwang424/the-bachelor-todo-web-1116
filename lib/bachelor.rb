require 'byebug'

def get_first_name_of_season_winner(data, season)

  winner = ""
  index = 0

  data.each do |series,contestants|
    #debugger if series == season
    if series == season
      contestants.each do |statistics|      #this point is an array
        #debugger
        index = data[series].index(statistics)
        statistics.each do |field,information|
          #debugger
          if field == "status" && data[series][index][field] == "Winner"
            #debugger
            winner = data[series][index]["name"]
          end
        end
      end
    end
  end
  winner.split[0]
end


def get_contestant_name(data, occupation)
    name = ""
    index = 0

    data.each do |series, contestants|
      contestants.each do |statistics|
        index = data[series].index(statistics)
        statistics.each do |stat, information|
          if stat == "occupation" && data[series][index][stat] == occupation
            name = data[series][index]["name"]
          end
        end
      end
    end
    name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  index = 0

  data.each do |season, contestants|
    contestants.each do |statistics|
      index = data[season].index(statistics)
      statistics.each do |stat, information|
        if stat == "hometown" && data[season][index][stat] == hometown
          count += 1
        end
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  job = ""
  index = 0

  data.each do |season, contestants|
    contestants.each do |stats|
      index = data[season].index(stats)
      stats.each do |stat, info|
        if stat == "hometown" && data[season][index]["hometown"] == hometown
          return job = data[season][index]["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  index = 0
  number_of_contestants = 0
  age = 0

  data.each do |seasons, contestants|
    if seasons == season
      #debugger
      contestants.each do |statistics|      #this is an array
        index = data[seasons].index(statistics)
        statistics.each do |stat,info|
          if stat == "age"
            age += data[seasons][index]["age"].to_i
            number_of_contestants += 1
          end
        end
      end
    end
  end
  (age.to_f/ number_of_contestants).round
end
