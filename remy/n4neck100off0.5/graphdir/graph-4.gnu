set xrange [-1:2.8393738979384278] reverse
set yrange [0:2.539316843850599]
#set logscale x 2
#set logscale y 2

set xtics ("1" log(1)/log(2), "2" log(2)/log(2), "4" log(4)/log(2), "8" log(8)/log(2), "16" log(16)/log(2), "32" log(32)/log(2), "64" log(64)/log(2), "128" log(128)/log(2), "256" log(256)/log(2), "512" log(512)/log(2), "1024" log(1024)/log(2), "2048" log(2048)/log(2), "4096" log(4096)/log(2), "8192" log(8192)/log(2), "16384" log(16384)/log(2), "32768" log(32768)/log(2))

set xlabel "Queueing delay (ms)"
set ylabel "Throughput (Mbps)"
set grid

#set title "15 Mbps dumbbell, Empirical distribution of flow lengths, nsrc 4"

unset key

set terminal svg fontscale 2
set output "graph-4.svg"
set label "Cubic/sfqCoDel" at 1,1.31 point textcolor lt 1
set label "Vegas" at -0.321928094887342,0.01 point textcolor lt 1
set label "XCP" at 2.70043971814109,2.33 point textcolor lt 1
set label "NewReno" at 1,1.15 point textcolor lt 1
set label "Compound" at 1.07038932789139,1.35 point textcolor lt 1
set label "RemyCC-0.1" at -0.73696559416622,1.98 point textcolor lt 1
set label "RemyCC-1" at -0.73696559416622,1.635 point textcolor lt 1
set label "Cubic" at 1.07038932789139,1.32 point textcolor lt 1
set label "RemyCC-10" at -0.73696559416622,1.37 point textcolor lt 1
plot "Cubic-sfqCoDel-4.ellipse" with lines lt 1, "TCP-Vegas-4.ellipse" with lines lt 1, "TCP-Reno-XCP-4.ellipse" with lines lt 1, "TCP-Newreno-4.ellipse" with lines lt 1, "TCP-Linux-compound-4.ellipse" with lines lt 1, "TCP-Rational-0.1-4.ellipse" with lines lt 1, "TCP-Rational-1-4.ellipse" with lines lt 1, "TCP-Linux-cubic-4.ellipse" with lines lt 1, "TCP-Rational-10-4.ellipse" with lines lt 1
set output
