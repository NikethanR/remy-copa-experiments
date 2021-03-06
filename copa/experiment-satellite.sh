#!/bin/bash

trace_file=~/traces/trace-42Mbps
min_delay=200 # One way delay in ms
loss_rate=0.0074
output_directory=Satellite
nsrc=2
#rat_file=../evaluations/rats/fig2-linkspeed/bigbertha-100x.dna.5
#rat_file=../evaluations/rats/fig4-rtt/rtt_30x.dna.2
rat_file=rats/fig2-linkspeed/bigbertha2.dna.5

if [[ ! -d $output_directory ]]; then
		mkdir $output_directory
fi

if [[ $1 == "run" ]]; then
		for buffer in 4200000; do #4500 45000 420000 4200000; do
				echo "Running on buffer size = $buffer bytes"
				for delta_conf in "constant_delta:0.1" "constant_delta:0.5" "constant_delta:1"; do #"constant_delta:0.1" "constant_delta:0.5" "constant_delta:1"; do
				    #continue
						runstr="./satellite-long-run.sh run markovian $trace_file $min_delay $loss_rate $output_directory $nsrc:continuous $buffer $delta_conf"
						echo $runstr
						$runstr
						#if [[ -d $output_directory/markovian-$delta_conf::$loss_rate ]]; then
						#		trash $output_directory/markovian-$delta_conf::$buffer
						#fi
						#mv $output_directory/markovian-$delta_conf $output_directory/markovian-$delta_conf::$buffer
				done
				
				for cc_type in "bbr" "cubic"; do # "pcc" "cubic" "remy"; do
						runstr="./satellite-long-run.sh run $cc_type $trace_file $min_delay $loss_rate $output_directory $nsrc:continuous $buffer $rat_file"
						echo $runstr
						$runstr
						#if [[ -d $output_directory/$cc_type::$loss_rate ]]; then
						#		trash $output_directory/$cc_type::$buffer
						#fi
						#mv $output_directory/$cc_type $output_directory/$cc_type::$buffer
				done
		done

elif [[ $1 == "graph" ]]; then
		if [[ -d $output_directory/graphdir ]]; then
				trash $output_directory/graphdir
		fi
		mkdir $output_directory/graphdir

		for tcp_dir in $output_directory/*; do
				tcp=`expr "$tcp_dir" : ".*/\([^/]*\)::[0-9.]*"`
				buffer=`expr "$tcp_dir" : ".*::\([0-9.]*\)"`
				
				# Gather statistics
				if [[ $tcp = * ]]; then
						./mm-throughput-graph 100 $tcp_dir/$tcp.uplink >$tcp_dir/$tcp.tpt-graph 2>$tcp_dir/$tcp.stats
				fi
				throughput=`grep throughput $tcp_dir/$tcp.stats | awk -F ' ' '{print $3}'`
				delay=`grep 95.*queueing $tcp_dir/$tcp.stats | awk -F ' ' '{print $6}'`
				echo $buffer $throughput $delay >>$output_directory/graphdir/$tcp.dat
		done

		# Create gnuplot script
		gnuplot_script_tpt="set xlabel 'Buffer Size (Bytes)'; set ylabel 'Throughput (Mbits/s)';
    set terminal svg fsize 14; set output '$output_directory/graphdir/buff-tpt.svg'; 
    set logscale xy 10;
    plot " >>$output_directory/graphdir/loss-tpt.gnuplot
		gnuplot_script_delay="set xlabel 'Buffer Size (Bytes)'; set ylabel 'Queuing Delay (ms)';
    set terminal svg fsize 14; set output '$output_directory/graphdir/buff-del.svg'; 
    set logscale xy 10;
    plot " >>$output_directory/graphdir/loss-del.gnuplot
		for tcp in $output_directory/graphdir/*.dat; do
				tcp_nice=`expr "$tcp" : ".*/\([^/]*\).dat"`
				echo $tcp $tcp_nice
				gnuplot_script_tpt="$gnuplot_script_tpt '$tcp' using 1:2 title '$tcp_nice' with lines, "
				gnuplot_script_delay="$gnuplot_script_delay '$tcp' using 1:3 title '$tcp_nice' with lines, "
		done
		echo $gnuplot_script_tpt >$output_directory/graphdir/buff-tpt.gnuplot
		echo $gnuplot_script_delay >$output_directory/graphdir/buff-del.gnuplot
	
		gnuplot -p $output_directory/graphdir/buff-tpt.gnuplot
		inkscape --export-png=$output_directory/graphdir/buff-tpt.png -b '#ffffff' -D $output_directory/graphdir/buff-tpt.svg
		display $output_directory/graphdir/buff-tpt.png

		gnuplot -p $output_directory/graphdir/buff-del.gnuplot
		inkscape --export-png=$output_directory/graphdir/buff-del.png -b '#ffffff' -D $output_directory/graphdir/buff-del.svg
		display $output_directory/graphdir/buff-del.png
		
elif [[ $1 == "clean" ]]; then
		trash $output_directory

else
		echo "Unrecognized command '$1'."
		echo "   Expected one of [run|graph|clean]"
fi
