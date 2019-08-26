
use_bpm 80
define :qianzou do
  
  use_synth :piano
  sleep 0.25
  play_pattern_timed [:a4,:g4,:e4,:a4,:g4,:e4],
    [0.25,0.25,0.25,0.5,0.25,0.25]
  sleep 0.25
  play_pattern_timed [:a4,:g4,:e4,:a4,:g4,:e4],
    [0.25,0.25,0.25,0.5,0.25,0.25]
  sleep 0.25
  play_pattern_timed [:g4,:d4,:c4,:g4,:d4,:c4],
    [0.25,0.25,0.25,0.5,0.25,0.25]
  sleep 0.25
  play_pattern_timed [:g4,:d4,:c4,:g4,:d4,:c4],
    [0.25,0.25,0.25,0.5,0.25,0.25]
end
define :light do
  use_synth :beep
  
  play_pattern_timed [:a4,:e5,:d5,:g5],[0.5,0.5,0.5,0.5],amp:0.3
  sleep 2
  play_pattern_timed [:g4,:b4,:d5,:g5],[0.5,0.5,0.5,0.5],amp:0.3
  sleep 2
end
define :hi_hat do
  sample :drum_cymbal_closed ,amp:0.3 ,pan: 0.9
  sleep 0.25
end
define :main_theme do
  sleep 2
  use_synth :pretty_bell
  play_pattern_timed [:a4,:c5,:d5,:d5,:e5,:c5,:a4,:c5,:d5,:d5,:g5,:e5,:e5,:g5,:a5,:a5,:a5,:c6,:b5,:a5,:g5,:f5,:e5,:d5,:a4,:e5,
  :a4,:c5,:d5,:d5,:e5,:c5,:a4,:c5,:d5,:g5,:e5,:e5,:g5,:a5,:a5,:a5,:c6,:b5,:a5,:e5,:a4,:c5],
    [0.5,0.5,1,0.5,0.5,1,0.5,0.5,1,0.5,0.5,1,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,1,0.5,0.5,1,
     0.5,0.5,1,0.5,0.5,1,0.5,0.5,1,1,1,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,1], amp:1.3,sustain:0.8
end
in_thread delay:21 do
  loop do main_theme
  end
end

in_thread delay:8 do
  2.times do
    light
  end
end
in_thread delay:16 do
  loop do
    hi_hat
  end
end


in_thread do
  loop do
    qianzou
  end
end


