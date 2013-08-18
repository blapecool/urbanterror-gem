module UrbanTerror
  
  def self.gear_calc(gear_array)
    gear_array.each{ |w| raise "No such gear type '#{w}'" unless GEAR_TYPES.has_key?(w) }
    MAX_GEAR - gear_array.map{|w| GEAR_TYPES[w] }.reduce(:+)
  end
  
  def self.reverse_gear_calc(number)
    raise "#{number} is outside of the range 0 to 63." unless (0..63).include?(number)
    GEAR_TYPES.select{|weapon, gear_val| number & gear_val == 0 }.map(&:first)
  end
  
  def self.gametype_name(number, abbreviate=false)
    raise "#{number} is not a valid gametype." unless GAME_MODES.has_key? number
    GAME_MODES[number][abbreviate ? 1 : 0]
  end 
end