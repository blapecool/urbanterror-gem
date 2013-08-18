module UrbanTerror
  MAX_GEAR = 63
		
	GEAR_TYPES = {
    'knives'   => 0,
    'grenades' => 1,
    'snipers'  => 2,
    'spas'     => 4,
    'pistols'  => 8,
    'autos'    => 16,
    'negev'    => 32
  }

  GAME_MODES = {
    0 => ['Free For All',      'FFA'],
    1 => ['Last Man Standing', 'LMS'],
    3 => ['Team Death Match',  'TDM'],
    4 => ['Team Survivor',     'TS'],
    5 => ['Follow the Leader', 'FTL'],
    6 => ['Capture and Hold',  'CAH'],
    7 => ['Capture the Flag',  'CTF'],
    8 => ['Bomb mode',         'BOMB'],
    9 => ['Jump mode',         'JUMP']
  }

end