
use_bpm 70
define :qianzou do
  use_synth :piano
  sleep 0.25
  play_pattern_timed [:a5,:g5,:e5,:a5,:g5,:e5],
    [0.25,0.25,0.25,0.5,0.25,0.25]
  sleep 0.25
  play_pattern_timed [:a5,:g5,:e5,:a5,:g5,:e5],
    [0.25,0.25,0.25,0.5,0.25,0.25]
  sleep 0.25
  play_pattern_timed [:g5,:d5,:c5,:g5,:d5,:c5],
    [0.25,0.25,0.25,0.5,0.25,0.25]
  sleep 0.25
  play_pattern_timed [:g5,:d5,:c5,:g5,:d5,:c5],
    [0.25,0.25,0.25,0.5,0.25,0.25]
end
define :light do
  use_synth :beep
  
  play_pattern_timed [:a4,:e5,:d5,:a5],[0.5,0.5,0.5,0.5],amp:0.3
  sleep 2
  play_pattern_timed [:g4,:b4,:d5,:g5],[0.5,0.5,0.5,0.5],amp:0.3
  sleep 2
end

in_thread delay:8 do
  2.times do
    light
  end
end


in_thread do
  loop do
    qianzou
  end
end


