set xrange [0:5.299200450343953] reverse
set yrange [0:1.724691623020815]
#set logscale x 2
#set logscale y 2

set xtics ("1" log(1)/log(2), "2" log(2)/log(2), "4" log(4)/log(2), "8" log(8)/log(2), "16" log(16)/log(2), "32" log(32)/log(2), "64" log(64)/log(2), "128" log(128)/log(2), "256" log(256)/log(2), "512" log(512)/log(2), "1024" log(1024)/log(2), "2048" log(2048)/log(2), "4096" log(4096)/log(2), "8192" log(8192)/log(2), "16384" log(16384)/log(2), "32768" log(32768)/log(2))

set xlabel "Queueing delay (ms)"
set ylabel "Throughput (Mbps)"
set grid

#set title "15 Mbps dumbbell, Empirical distribution of flow lengths, nsrc 16"

unset key

set terminal svg fontscale 2
set output "graph-16.svg"
set label "Cubic/sfqCoDel" at 4.84297883178832,1.1 point textcolor lt 1
set label "XCP" at 2.88752527074159,0.93 point textcolor lt 1
set label "RemyCC-0.1" at 3,1.63 point textcolor lt 1
set label "NewReno" at 2.71149490665009,0.6 point textcolor lt 1
set label "Cubic" at 3.26303440583379,0.9 point textcolor lt 1
set label "Vegas" at 1.48542682717025,0.01 point textcolor lt 1
set label "RemyCC-1" at 1.58496250072116,1.355 point textcolor lt 1
set label "Compound" at 3.03562390973072,0.72 point textcolor lt 1
set label "RemyCC-10" at 0.584962500721156,1.08 point textcolor lt 1
plot "Cubic-sfqCoDel-16.ellipse" with lines lt 1, "TCP-Reno-XCP-16.ellipse" with lines lt 1, "TCP-Rational-0.1-16.ellipse" with lines lt 1, "TCP-Newreno-16.ellipse" with lines lt 1, "TCP-Linux-cubic-16.ellipse" with lines lt 1, "TCP-Vegas-16.ellipse" with lines lt 1, "TCP-Rational-1-16.ellipse" with lines lt 1, "TCP-Linux-compound-16.ellipse" with lines lt 1, "TCP-Rational-10-16.ellipse" with lines lt 1
set output
