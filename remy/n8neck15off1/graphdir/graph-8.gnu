set xrange [0:4.456650958110523] reverse
set yrange [0:1.883471343860165]
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
set label "Compound" at 3.29278174922785,1 point textcolor lt 1
set label "RemyCC-1" at 0.485426827170248,1.48 point textcolor lt 1
set label "RemyCC-0.1" at 0.925999418556228,1.75 point textcolor lt 1
set label "RemyCC-10" at 0.378511623253742,1.11 point textcolor lt 1
set label "XCP" at 3.67807190511264,1.24 point textcolor lt 1
set label "Vegas" at 1,0 point textcolor lt 1
set label "NewReno" at 3.43962313755712,0.855 point textcolor lt 1
set label "Cubic/sfqCoDel" at 3.91169158187234,1.135 point textcolor lt 1
set label "Cubic" at 3.29278174922785,1.025 point textcolor lt 1
plot "TCP-Linux-compound-8.ellipse" with lines lt 1, "TCP-Rational-1-8.ellipse" with lines lt 1, "TCP-Rational-0.1-8.ellipse" with lines lt 1, "TCP-Rational-10-8.ellipse" with lines lt 1, "TCP-Reno-XCP-8.ellipse" with lines lt 1, "TCP-Vegas-8.ellipse" with lines lt 1, "TCP-Newreno-8.ellipse" with lines lt 1, "Cubic-sfqCoDel-8.ellipse" with lines lt 1, "TCP-Linux-cubic-8.ellipse" with lines lt 1
set output
