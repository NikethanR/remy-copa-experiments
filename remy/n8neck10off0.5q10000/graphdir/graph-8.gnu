set xrange [0:5.483808740833887] reverse
set yrange [0:1.6210863785537146]
#set logscale x 2
#set logscale y 2

set xtics ("1" log(1)/log(2), "2" log(2)/log(2), "4" log(4)/log(2), "8" log(8)/log(2), "16" log(16)/log(2), "32" log(32)/log(2), "64" log(64)/log(2), "128" log(128)/log(2), "256" log(256)/log(2), "512" log(512)/log(2), "1024" log(1024)/log(2), "2048" log(2048)/log(2), "4096" log(4096)/log(2), "8192" log(8192)/log(2), "16384" log(16384)/log(2), "32768" log(32768)/log(2))

set xlabel "Queueing delay (ms)"
set ylabel "Throughput (Mbps)"
set grid

#set title "15 Mbps dumbbell, Empirical distribution of flow lengths, nsrc 8"

unset key

set terminal svg fontscale 2
set output "graph-8.svg"
set label "XCP" at 3.55458885167764,0.985 point textcolor lt 1
set label "Cubic" at 3.67807190511264,0.89 point textcolor lt 1
set label "NewReno" at 3.14567745519564,0.625 point textcolor lt 1
set label "Compound" at 3.10433665981473,0.68 point textcolor lt 1
set label "RemyCC-1" at 2.60880924267552,1.35 point textcolor lt 1
set label "Vegas" at 2,0.01 point textcolor lt 1
set label "RemyCC-0.1" at 4.18189764310839,1.54 point textcolor lt 1
set label "Cubic/sfqCoDel" at 5.32012359804061,1.14 point textcolor lt 1
set label "RemyCC-10" at 1.4329594072761,1.23 point textcolor lt 1
plot "TCP-Reno-XCP-8.ellipse" with lines lt 1, "TCP-Linux-cubic-8.ellipse" with lines lt 1, "TCP-Newreno-8.ellipse" with lines lt 1, "TCP-Linux-compound-8.ellipse" with lines lt 1, "TCP-Rational-1-8.ellipse" with lines lt 1, "TCP-Vegas-8.ellipse" with lines lt 1, "TCP-Rational-0.1-8.ellipse" with lines lt 1, "Cubic-sfqCoDel-8.ellipse" with lines lt 1, "TCP-Rational-10-8.ellipse" with lines lt 1
set output
