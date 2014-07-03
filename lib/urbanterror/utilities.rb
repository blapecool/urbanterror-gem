module UrbanTerror
  module_function

  def gear_calc(gear_array)
    gear_array.each{ |weapon| raise "No such weapon/object '#{weapon}'" unless GEAR_TYPES.has_key?(weapon) }
    gear_array.map{|weapon| GEAR_TYPES[weapon] }.join
  end
  
  def reverse_gear_calc(string)
    GEAR_TYPES.select{|weapon, gear_str| string.include? gear_str }.map(&:first)
  end


  def allowvote_calc(votes_array)
    votes_array.each{ |command| raise "No such voting command '#{command}'" unless VOTES_COMMANDS.has_key?(command) }
    MAX_ALLOWVOTE - votes_array.map{|command| VOTES_COMMANDS[command] }.reduce(:+)
  end
  
  def reverse_allowvote_calc(number)
    raise "#{number} is outside of the range 0 to #{MAX_ALLOWVOTE}." unless (0..MAX_ALLOWVOTE).include?(number)
    VOTES_COMMANDS.select{|weapon, gear_val| number & gear_val == 0 }.map(&:first)
  end


  def gametype_name(number, abbreviate=false)
    raise "#{number} is not a valid gametype." unless GAME_MODES.has_key? number
    GAME_MODES[number][abbreviate ? 1 : 0]
  end 


  def remove_q3colors(string)
    string.gsub(/\^([0-9])/, '')
  end
end
