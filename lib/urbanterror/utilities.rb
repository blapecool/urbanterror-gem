module UrbanTerror
  def self.gear_calc(gear_array)
    gear_array.each{ |weapon| raise "No such gear type '#{weapon}'" unless GEAR_TYPES.has_key?(weapon) }
    MAX_GEAR - gear_array.map{|weapon| GEAR_TYPES[weapon] }.reduce(:+)
  end
  
  def self.reverse_gear_calc(number)
    raise "#{number} is outside of the range 0 to #{MAX_GEAR}." unless (0..MAX_GEAR).include?(number)
    GEAR_TYPES.select{|weapon, gear_val| number & gear_val == 0 }.map(&:first)
  end
  
  def self.allowvote_calc(votes_array)
    votes_array.each{ |command| raise "No such voting command '#{command}'" unless VOTES_COMMANDS.has_key?(command) }
    MAX_ALLOWVOTE - votes_array.map{|command| VOTES_COMMANDS[command] }.reduce(:+)
  end
  
  def self.reverse_allowvote_calc(number)
    raise "#{number} is outside of the range 0 to #{MAX_ALLOWVOTE}." unless (0..MAX_ALLOWVOTE).include?(number)
    VOTES_COMMANDS.select{|weapon, gear_val| number & gear_val == 0 }.map(&:first)
  end


  def self.gametype_name(number, abbreviate=false)
    raise "#{number} is not a valid gametype." unless GAME_MODES.has_key? number
    GAME_MODES[number][abbreviate ? 1 : 0]
  end 
end