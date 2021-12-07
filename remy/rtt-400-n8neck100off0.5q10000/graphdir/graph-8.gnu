set xrange [0:3.3191714201148295] reverse
set yrange [0:1.210896821042819]
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
set label "XCP" at 3.18586654531134,1.07 point textcolor lt 1
set label "RemyCC-0.1" at 1.07038932789141,0.75 point textcolor lt 1
set label "RemyCC-10" at 1.07038932789141,0.57 point textcolor lt 1
set label "Vegas" at 1.20163386116966,0.01 point textcolor lt 1
set label "Cubic" at 1.92599941855623,0.56 point textcolor lt 1
set label "Compound" at 1.90689059560852,0.54 point textcolor lt 1
set label "NewReno" at 1.84799690655495,0.43 point textcolor lt 1
set label "RemyCC-1" at 1.07038932789141,0.74 point textcolor lt 1
set label "Cubic/sfqCoDel" at 2.07038932789139,0.615 point textcolor lt 1
plot "TCP-Reno-XCP-8.ellipse" with lines lt 1, "TCP-Rational-0.1-8.ellipse" with lines lt 1, "TCP-Rational-10-8.ellipse" with lines lt 1, "TCP-Vegas-8.ellipse" with lines lt 1, "TCP-Linux-cubic-8.ellipse" with lines lt 1, "TCP-Linux-compound-8.ellipse" with lines lt 1, "TCP-Newreno-8.ellipse" with lines lt 1, "TCP-Rational-1-8.ellipse" with lines lt 1, "Cubic-sfqCoDel-8.ellipse" with lines lt 1
set output
