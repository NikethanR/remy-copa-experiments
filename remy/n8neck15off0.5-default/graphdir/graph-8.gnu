set xrange [0:4.766064833990525] reverse
set yrange [0:1.8086600995027577]
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
set label "RemyCC-1" at 0.765534746362967,1.435 point textcolor lt 1
set label "Vegas" at 1.51096191927738,0.01 point textcolor lt 1
set label "Cubic" at 3.05311133645956,1.005 point textcolor lt 1
set label "RemyCC-10" at 0.378511623253742,1.12 point textcolor lt 1
set label "NewReno" at 2.98185265328974,0.7 point textcolor lt 1
set label "XCP" at 3.51727569320958,1.2 point textcolor lt 1
set label "Cubic/sfqCoDel" at 4.38543103719352,1.27 point textcolor lt 1
set label "RemyCC-0.1" at 1.4594316186373,1.715 point textcolor lt 1
set label "Compound" at 3.11270013274936,0.835 point textcolor lt 1
plot "TCP-Rational-1-8.ellipse" with lines lt 1, "TCP-Vegas-8.ellipse" with lines lt 1, "TCP-Linux-cubic-8.ellipse" with lines lt 1, "TCP-Rational-10-8.ellipse" with lines lt 1, "TCP-Newreno-8.ellipse" with lines lt 1, "TCP-Reno-XCP-8.ellipse" with lines lt 1, "Cubic-sfqCoDel-8.ellipse" with lines lt 1, "TCP-Rational-0.1-8.ellipse" with lines lt 1, "TCP-Linux-compound-8.ellipse" with lines lt 1
set output
