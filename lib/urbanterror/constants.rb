module UrbanTerror
  MAX_GEAR = 63
  MAX_ALLOWVOTE = 1073741823

  GEAR_TYPES = {
    'knives'   => 0,
    'grenades' => 1,
    'snipers'  => 2,
    'spas'     => 4,
    'pistols'  => 8,
    'autos'    => 16,
    'negev'    => 32
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