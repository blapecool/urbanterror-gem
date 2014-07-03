module UrbanTerror
  module_function

  # Calculate g_gear value for weapons you want to disalow in game
  #
  # @param gear_array [Array] Array containing all weapon names you want to disallow
  # @return [String] g_gear value
  def gear_calc(gear_array)
    gear_array.each{ |weapon| raise "No such weapon/object '#{weapon}'" unless GEAR_TYPES.has_key?(weapon) }
    gear_array.map{|weapon| GEAR_TYPES[weapon] }.join
  end

  # Gives the list of weapons disallowed for a given g_gear value
  #
  # @param string [String] String containing g_gear value
  # @return [Array] List of weapon disallowed
  def reverse_gear_calc(string)
    GEAR_TYPES.select{|weapon, gear_str| string.include? gear_str }.map(&:first)
  end

  # Calculate g_allowvote value for vote commands you want to allow in game
  #
  # @param votes_array [Array] Array containing all vote commands allow
  # @return [String] g_allowvote value
  def allowvote_calc(votes_array)
    votes_array.each{ |command| raise "No such voting command '#{command}'" unless VOTES_COMMANDS.has_key?(command) }
    MAX_ALLOWVOTE - votes_array.map{|command| VOTES_COMMANDS[command] }.reduce(:+)
  end
  
  # Gives the list of vote commands allowed for a given g_allowvote value
  #
  # @param number [Fixnum] g_allowvote value
  # @return [Array] List of vote commands allowed
  def reverse_allowvote_calc(number)
    raise "#{number} is outside of the range 0 to #{MAX_ALLOWVOTE}." unless (0..MAX_ALLOWVOTE).include?(number)
    VOTES_COMMANDS.select{|weapon, gear_val| number & gear_val == 0 }.map(&:first)
  end

  # Gives the game type name (or short name) for a given g_gametype number
  #
  # @param number [Fixnum] g_gametype value
  # @param abbreviate [Bool] Set it to True if you want the short name
  # @return [String] Game type name
  def gametype_name(number, abbreviate=false)
    raise "#{number} is not a valid gametype." unless GAME_MODES.has_key? number
    GAME_MODES[number][abbreviate ? 1 : 0]
  end 

  # Remove all Q3 colors code for a given string
  #
  # @param string [String] A string with Q3 colors code
  # @return [String] A string with all color codes removed
  def remove_q3colors(string)
    string.gsub(/\^([0-9])/, '')
  end
end
