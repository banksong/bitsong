use_bpm 100
define :qz_youling do
  use_synth :fm
  play_pattern_timed [:e4,:a4,:c5,:a4,:e4,:a4,:c5,:a4,:e4,:ab4,:b4,:ab4,:e4,:ab4,:b4,:ab4],
    [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
end

define :big_trump do
  use_synth :dsaw
  play_pattern_timed [:a3,:a3,:a3,:g3,:a3,:g3,:g3,:a3,:g3,:a3,:a3,:a3,:g3,:a3,:g3,:g3,:a3,:g3],
    [1,1,1,0.5,0.5,1,0.5,0.5,2,1,1,1,0.5,0.5,1,0.5,0.5,2], attach:0.04, release: 0.8, amp:3
end

define :hi_hat do
  sample :drum_cymbal_closed
  sleep 0.5
end
define :drum1 do
  sample :drum_bass_soft, amp:3
  sleep 2
  sample :drum_bass_soft, amp:3
  sleep 2
end
in_thread do
  loop do
    qz_youling
  end
end
in_thread delay:0 do
  loop do
    big_trump
  end
end
in_thread delay:16 do
  loop do
    hi_hat
  end
end
in_thread delay:16 do
  loop do
    drum1
  end
end



