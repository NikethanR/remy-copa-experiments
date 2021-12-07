set xrange [0:3.3532372511984088] reverse
set yrange [0:0.8173847176454401]
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
set label "Cubic/sfqCoDel" at 2.2630344058338,0.42 point textcolor lt 1
set label "RemyCC-1" at 1.07038932789141,0.355 point textcolor lt 1
set label "RemyCC-0.1" at 1.07038932789141,0.39 point textcolor lt 1
set label "NewReno" at 2.41953889151378,0.41 point textcolor lt 1
set label "XCP" at 3.16188768237689,0.7 point textcolor lt 1
set label "RemyCC-10" at 1.07038932789141,0.3 point textcolor lt 1
set label "Compound" at 2.26303440583378,0.435 point textcolor lt 1
set label "Cubic" at 2.16992500144231,0.395 point textcolor lt 1
set label "Vegas" at 1.20163386116962,0.01 point textcolor lt 1
plot "Cubic-sfqCoDel-8.ellipse" with lines lt 1, "TCP-Rational-1-8.ellipse" with lines lt 1, "TCP-Rational-0.1-8.ellipse" with lines lt 1, "TCP-Newreno-8.ellipse" with lines lt 1, "TCP-Reno-XCP-8.ellipse" with lines lt 1, "TCP-Rational-10-8.ellipse" with lines lt 1, "TCP-Linux-compound-8.ellipse" with lines lt 1, "TCP-Linux-cubic-8.ellipse" with lines lt 1, "TCP-Vegas-8.ellipse" with lines lt 1
set output
