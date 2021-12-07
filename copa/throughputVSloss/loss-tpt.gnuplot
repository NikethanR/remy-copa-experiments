set xlabel 'Loss Rate'; set ylabel 'Throughput (Mbps)'; set terminal svg fsize 14; set output 'LossyLink/graphdir/loss-tpt.svg'; plot 'LossyLink/graphdir/bbr.dat' using 1:2 title 'bbr' with lines, 'LossyLink/graphdir/cubic.dat' using 1:2 title 'cubic' with lines, 'LossyLink/graphdir/markovian-constant_delta:0.1.dat' using 1:2 title 'markovian-constant_delta:0.1' with lines, 'LossyLink/graphdir/markovian-constant_delta:0.5.dat' using 1:2 title 'markovian-constant_delta:0.5' with lines, 'LossyLink/graphdir/markovian-constant_delta:1.dat' using 1:2 title 'markovian-constant_delta:1' with lines, 'LossyLink/graphdir/remy.dat' using 1:2 title 'remy' with lines,
