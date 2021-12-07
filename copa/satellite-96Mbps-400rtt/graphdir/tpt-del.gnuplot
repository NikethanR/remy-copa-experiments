set terminal svg fsize 14; set output 'Satellite/graphdir/tpt-del.svg'; 
          set xlabel 'Median Queuing Delay (ms)'; set ylabel 'Throughput (Mbps)';
          set title 'Performance on an Emulated Satellite Link'; 
          set xrange [] reverse; set logscale x 2;
          plot 'Satellite/graphdir/tpt-del.data' using 3:2:1 with labels point  pt 7 offset char 1,1 notitle;
