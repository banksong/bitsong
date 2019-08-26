use_bpm 150

define :kuaiban do
  use_synth :sine
  play_pattern_timed [:A6,:A6,:E6,:E6,:Gb6,:Ab6,:A6,:Gb6,:E6,:E6,:D6,:D6,:Db6,:Db6,:B5,:A5,:B5,:Db6,:A5],
    [1,1,1,1,0.5,0.5,0.5,0.5,1,1,1,1,1,1,0.5,0.5,0.5,0.5,2]
end
define :ch do
  with_fx :reverb do
    use_synth :beep
    play_pattern_timed [(chord :A,:M),(chord :Gb,:m),(chord :B,:m),(chord :E,:M7),(chord :A,:M)],
      [4,4,4,2,2]
  end
end
define :soft_drum1 do
  sleep 2
  sample :drum_snare_soft, amp:3
  sleep 4
  sample :drum_snare_soft, amp:3
  sleep 4
  sample :drum_snare_soft, amp:3
  sleep 4
  sample :drum_snare_soft, amp:3
  sleep 1
  sample :drum_snare_soft, amp:3
  sleep 1
end
define :drum1 do
  sample :drum_bass_hard, amp:3
  sleep 1
  sample :drum_bass_soft, amp:3
  sleep 2.5
  sample :drum_bass_soft, amp:3
  sleep 2.5
  sample :drum_bass_soft, amp:3
  sleep 2
end
define :hi_hat do
  sample :drum_cymbal_closed
  sleep 1
end
in_thread do
  loop do
    drum1
  end
end

in_thread do
  loop do
    ch
  end
end
in_thread do
  loop do
    soft_drum1
  end
end


in_thread do
  loop do
    hi_hat
  end
end

in_thread do
  
  loop do
    kuaiban
  end
  
end


