# Welcome to Sonic Pi v2.10
use_bpm 100
define :drum do
  use_synth_defaults amp:1
  sample :drum_bass_soft
  sleep 1
  sample :drum_snare_soft
  sleep 1
end

define :jianzhoudrum do
  use_synth_defaults amp:1
  sample :drum_bass_soft
  sleep 1
  sample :drum_snare_soft
  sleep 1
  sample :drum_bass_soft
  sleep 0.5
  sample :drum_bass_soft
  sleep 0.5
  sample :drum_snare_soft
  sleep 1
end

define :maintojianzhoudrum do
  use_synth_defaults amp:1
  sample :drum_bass_soft
  sleep 1
  sample :drum_bass_soft
  sleep 1
end

define :baseline do
  
  use_synth :fm
  play_pattern_timed [:c3,:c3,:c3,:c3,:c3], [0.5,0.25,0.25,0.5,0.5], amp:0.8,attack:0.01,release:0.3
  sleep 2
  
  play_pattern_timed [:f2,:g2,:e2,:f2,:f2], [0.5,0.25,0.25,0.5,0.5], amp:0.8,attack:0.01,release:0.3
  sleep 2
  
  ##| use_synth :dsaw
  ##| play_pattern_timed [:b2,:c3,:c3],[0.5,0.25,0.25],  amp:0.8, attack:0.01,release:0.8
  ##| sleep 1
end

define :jianzhouline do
  ##| sample :ambi_soft_buzz
  ##| sample :bass_drop_c
  ##| sample :bass_hard_c
  ##| sample :guit_e_slide
  
  sleep 4
end

define :gitar do
  sleep 2
  use_synth_defaults amp:1
  use_synth :dsaw
  play_pattern_timed [0.5,0.25,0.25]
end

define :frontend do
  use_synth :beep
  play_pattern_timed [:b4,:c5,:b4,:c5,:b4,:c5],[0.5,1,0.5,1,0.5,0.5]
  play_pattern_timed [:a4],[4]
  play_pattern_timed [:b4,:c5,:b4,:c5,:d5,:c5],[0.5,1,0.5,1,0.5,0.5]
  play_pattern_timed [:a4],[4]
  
  play_pattern_timed [:b4,:c5,:d5,:e5,:b4,:c5],[0.5,1,0.5,1,0.5,0.5]
  play_pattern_timed [:b4,:c5,:d5,:e5,:b4,:c5],[0.5,1,0.5,1,0.5,0.5]
  play_pattern_timed [:a4],[4]
  
  sleep 1.5
  play_pattern_timed [:g3,:a3,:c4,:d4,:e4], [0.5,0.5,0.5,0.5,0.5]
  sample :guit_e_slide
  sleep 4
  sleep 1.5
  play_pattern_timed [:e4,:d4,:c4,:d4,:e4], [0.5,0.5,0.5,0.5,0.5]
  sample :guit_e_slide
  sleep 4
  sleep 2.5
  play_pattern_timed [:c5,:d5,:c5],[0.5,0.5,0.5]
  play_pattern_timed [:g5,:e5] , [2,2]
  play_pattern_timed [:g5,:f5,:e5,:d5,:c5,:d5,:c5] ,[0.5,0.5,0.5,1,0.5,0.5,0.5]
  play_pattern_timed [:g5,:e5] , [2,2]
  play_pattern_timed [:g5,:a5,:c5,:d5,:c5,:d5,:c5] ,[0.5,0.5,0.5,1,0.5,0.5,0.5]
  play_pattern_timed [:e5],[4]
  sleep 2.5
  play_pattern_timed [:c5,:e5,:c5],[0.5,0.5,0.5]
  play_pattern_timed [:d5],[8]
end

define :gitargaochao do
  with_fx :level do
    use_synth_defaults amp:0.7
    use_synth :supersaw
    play_pattern_timed [:e4,:c4,:e4,:c4,:e4,:c4,:e4,:c4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    play_pattern_timed [:e4,:c4,:e4,:c4,:e4,:c4,:e4,:c4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    play_pattern_timed [:f4,:c4,:f4,:c4,:f4,:c4,:f4,:c4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    play_pattern_timed [:f4,:c4,:f4,:c4,:f4,:c4,:f4,:c4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
  end
end

in_thread delay:48 do
  2.times do
    gitargaochao
  end
end


in_thread delay:32 do
  loop do
    jianzhoudrum
  end
end

in_thread delay:28 do
  1.times do
    maintojianzhoudrum
  end
end


in_thread do
  loop do
    jianzhouline
  end
end

in_thread do
  4.times do
    baseline
  end
end

in_thread do
  1.times do
    frontend
  end
end


in_thread do
  14.times do
    drum
  end
end