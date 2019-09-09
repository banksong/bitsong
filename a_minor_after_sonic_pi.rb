use_bpm 100

##| set_mixer_control! amp:0, amp_slide:0
##| sleep 0.5

##| set_mixer_control! amp:2, amp_slide:8

##| set_volume! 4
##| fade_out = (line 0.5,0,steps:6, inclusive:false)

define :foo1 do
  sample "/home/pi/Music/a_minor(1).wav",amp:1
  sleep 16
end


define :foo2 do
  sample "/home/pi/Music/a_minor(2).wav",amp:1
  sleep 16
end


define :foo3 do
  sample "/home/pi/Music/a_minor.wav",amp:1
  sleep 16
end


define :hi_hat do
  
  sample :drum_cymbal_closed,amp:0.1
  sleep 1
  sample :drum_cymbal_closed,amp:0.1
  sleep 1
  sample :drum_cymbal_closed,amp:0.1
  sleep 1
  sample :drum_cymbal_closed,amp:0.1
  
end

define :maintheme do
  ##| count +=1
  ##|  count < 2
  with_fx :reverb ,room:0.5 do
    use_synth :hoover
    
    play_pattern_timed [:a5,:a5,:b5,:b5,:c6,:c6,:b5,:c6,:b5,:a5,:a5,:b5,:b5,:c6,:c6,:e6,:e6],[0.5,0.5,0.5,0.5,0.5,0.5,0.25,0.25,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    play_pattern_timed [:a5,:a5,:b5,:b5,:c6,:c6,:b5,:c6,:b5,:e5,:e5,:b5,:b5,:c6,:ab5,:a5,:b5],[0.5,0.5,0.5,0.5,0.5,0.5,0.25,0.25,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    ##|   else
    ##|     with_fx :reverb ,room:0.5 do
    ##|       use_synth :hoover
    ##|       use_synth_defaults amp:0.1
    ##|       play_pattern_timed [:a5,:a5,:b5,:b5,:c6,:c6,:b5,:c6,:b5,:a5,:a5,:b5,:b5,:c6,:c6,:e6,:e6],[0.5,0.5,0.5,0.5,0.5,0.5,0.25,0.25,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    ##|       play_pattern_timed [:a5,:a5,:b5,:b5,:c6,:c6,:b5,:c6,:b5,:e5,:e5,:b5,:b5,:c6,:ab5,:a5,:b5],[0.5,0.5,0.5,0.5,0.5,0.5,0.25,0.25,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    ##|     end
    ##|   end
    ##| end
  end
  
end



in_thread do
  1.times do
    foo1
  end
  sleep 112
  1.times do
    foo1
  end
end

in_thread delay:12 do
  hi_hat
end

##| sleep 16
puts "after the 4 bar fade in."

in_thread delay:16  do
  1.times do
    foo2
  end
end

in_thread delay:32 do
  6.times do
    foo3
  end
end

##| with_fx :leve, amp:1 do |va|
##| in_thread delay:32 do
##|   loop do
##|     control va,amp: get(:Lmaintheme),amp_slide:1
##|     sleep 1
##|   end
##| end

##| in_thread delay:32 do
##|   6.times do
##|     with_synth_defaults amp:0.5, release:0.5 do
##|       with_fx :level,amp:fade_out.tick do
##|         maintheme
##|       end
##|     end

##|   end
##| end






