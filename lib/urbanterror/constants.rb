module UrbanTerror
  MAX_ALLOWVOTE = 1073741823

  GEAR_TYPES = {
    "Beretta" => "F",
    "Desert Eagle" => "G",
    "SPAS 12" => "H",
    "MP5K" => "I",
    "UMP45" => "J",
    "HK69" => "K",
    "LR300ML" => "L",
    "G36" => "M",
    "PSG.1" => "N",
    "SR8" => "Z",
    "AK.103" => "a",
    "Negev" => "c",
    "Colt M4" => "e",
    "Glock" => "f",
    "Colt1911" => "g",
    "MAC11" => "h",
    "HE Grenade" => "O",
    "Smoke Grenade" => "Q",
    "Kevlar Vest" => "R",
    "Goggles" => "S",
    "Medkit" => "T",
    "Silencer" => "U",
    "Laser" => "V",
    "Helmet" => "W",
    "Extra Ammo" => "X",
  }

  VOTES_COMMANDS = {
    'reload'                      => 1,
    'restart'                     => 2,
    'map'                         => 4,
    'nextmap'                     => 8,
    'kick'                        => 16,
    'swapteams'                   => 32,
    'shuffleteams'                => 64,
    'g_friendlyfire'              => 128,
    'g_followstrict'              => 256,
    'g_gametype'                  => 512,
    'g_waveRespawns'              => 1024,
    'timelimit'                   => 2048,
    'fraglimit'                   => 4096,
    'capturelimit'                => 8192,
    'g_respawndelay'              => 16384,
    'redWaveRespawnDelay'         => 32768,
    'g_blueWaveRespawnDelay'      => 65536,
    'g_bombExplodeTime'           => 131072,
    'g_bombDefuseTime'            => 262144,
    'g_survivorRoundTime'         => 524288,
    'g_caputureScoreTime'         => 1048576,
    'g_warmup'                    => 2097152,
    'g_matchMode'                 => 4194304,
    'g_timeouts'                  => 8388608,
    'g_timeoutLength'             => 16777216,
    'exec'                        => 33554432,
    'g_swapRoles'                 => 67108864,
    'g_maxRounds'                 => 134217728,
    'g_gear'                      => 268435456,
    'cyclemap'                    => 536870912,
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
