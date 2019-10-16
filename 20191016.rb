use_transpose 3
use_bpm 120



define :gaochaochord do
  ##| with_fx :reverb,mix:0.2,room:0.3 do
  use_synth_defaults amp:1
  use_synth :saw
  use_octave -1
  play_chord [:g4,:c5,:e5],attack:0.01,release:4
  sleep 4
  play_chord [:g4,:c5,:e5],attack:0.01,release:4
  sleep 4
  play_chord [:g4,:b4,:e5],attack:0.01,release:4
  sleep 4
  play_chord [:g4,:b4,:e5],attack:0.01,release:4
  sleep 4
  play_chord [:g4,:c5,:d5]
  sleep 4
  play_chord [:g4,:c5,:d5]
  sleep 4
  play_chord [:g4,:d5,:f5]
  sleep 4
  play_chord [:g4,:d5,:f5]
  sleep 4
  
  play_chord [:g4,:c5,:e5]
  sleep 1
  play_chord [:g4,:c5,:e5]
  sleep 1
  play_chord [:g4,:b4,:e5]
  sleep 1
  play_chord [:g4,:b4,:e5]
  sleep 1
  play_chord [:g4,:c5,:d5]
  sleep 1
  play_chord [:g4,:c5,:d5]
  sleep 1
  play_chord [:g4,:d5,:f5]
  sleep 1
  play_chord [:g4,:d5,:f5]
  sleep 1
  
  
  
  ##| end
end



define :kb do
  with_fx :band_eq do
    use_synth_defaults amp:1
    use_synth  :piano
    use_transpose [0,5].choose
    play (scale :c4,:major_pentatonic).tick
    sleep 0.5
    ##| sleep 0.5
    ##| play_pattern_timed [:e5,:c5,:e5,:c5,:e5,:c5,:e5,:c5],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    ##| play_pattern_timed [:e5,:c5,:e5,:c5,:e5,:c5,:e5,:c5],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    
    ##| play_pattern_timed [:d5,:b4,:d5,:b4,:d5,:b4,:d5,:b4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    ##| play_pattern_timed [:f5,:b4,:f5,:b4,:f5,:b4,:f5,:b4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
  end
end

define :artick do
  s = rrand(0,0.7)
  t = rrand(0.03, 0.3)
  e = s + t
  a = rrand(0.5,1.0)
  sample :guit_e_fifths,rate:-1,beat_stretch:4
  sleep 4
end


define :forsample do
  ##| sample :loop_amen,beat_stretch:4,rate:0.5
  ##| with_fx :compresso
  ##| with_fx :reverb, room:0.8,mix:0.5 do
  sample :misc_cineboom,beat_stretch:4,rate:0.5
  sleep 4
  ##| end
  ##| end
end


live_loop :kick do
  sample :drum_cymbal_soft
  sleep 1
end


in_thread do
  loop do
    forsample
  end
end

in_thread do
  loop do
    kb
  end
end
