# Remy Copa Experiments

### PRESENTATION-LINK
https://docs.google.com/presentation/d/1HDNpjI3670tfvXougV40RLTOcOxQZlmZ/edit?usp=sharing&ouid=105085625914673633208&rtpof=true&sd=true

All the generated results can be found in appropriate folders for remy and copa <br />

### Remy SETUP
Follow the instructions from https://web.mit.edu/remy/#reproduce and use the https://web.mit.edu/remy/remy-reproduce-1.0.tar.gz ns2 intergration files <br />
The following additional steps are required for the simulations to work- <br />
Install python2 <br />
Install proto buffer 2.6.1, the remy files use an older version and the version of protobuf on system will most likely be 3+ so this has to be installed from protobuf repo- https://github.com/protocolbuffers/protobuf/releases/tag/v2.6.1 <br />
Run the following instructions in the cloned repo folder to install protobuf, this might take some time <br />
```
./autogen.sh
./configure
 make
 make check
 sudo make install
```

run ./install in the remy-reproduce-1.0 folder <br />
If there are X11 headers missing errors - sudo apt install libx11-dev <br />
If compilation errors for accumulate or vector or encountered - add the missing imports: <br />
for accumulate, add `#include <numeric>` sfd-rate-estimator.cc <br />
for vector, add `#include <numeric>` to sfd-dropper.cc <br />

To plot the results, follow the instructions from https://web.mit.edu/remy/#reproduce with following changes - <br />
Find and change `fsize` to `fontscale` in the graphmaker perl script <br />
to install plotting libraries: sudo apt-get install gnuplot inkscape <br />

### Running Remy experiments
TO change the number of sources change it in run-figure4-parallel file and also change the conf files used there to the files you want use from remyconf folder <br />
Link speed, RTT, offavg etc can be changed in the conf files <br />
Note - to change RTT change the delay option in the conf file and update the minRTT in the graphmaker file (if delay set at 200 set minrtt in graph maker file to 400)<br />

### Copa
Follow the instructions from https://web.mit.edu/copa/#reproduce, some additional steps required to run the experiments- <br />

Fairness - Throughput stddev plot: <br />
```
./experiment-dynamic.sh run 
./experiment-dynamic.sh graph
```

Throughput vs loss plot: <br />
Use the modified experiment-loss.sh, long-run.sh file from this repo, we have changed some parts of it.. we added do_ss option to delta conf for all the markovian ccs as that option seems to be necessary for the current copa version <br />
Place the remy rat file of choice in the copa-evaluation folder and change the file name in ./experiment-loss.sh file, we used delta0.1.dna file(generated from our remy experiment) <br />

```
./experiment-loss.sh run
./loss-run.sh graph (to generate stats for each protocol-lossrate comibination)
./experiment-loss.sh graph (to generate the plot using the generated stats from the above steps)
```

Satelite link experiment plot: <br />
Use the modified experiment-satellite.sh and a new satellite-long-run.sh file from this repo <br />
```
./experiment-satellite.sh run
./satellite-long-run.sh graph
./experiment-satellite.sh graph
```

Note - the trace files have to be already present to run these experiments <br />
To change link speeds in thee experiment create a trace file for ex- 12Mbps and put just 1 in that file <br />
similarly for 36Mbps use the following in the file - <br />
```
0
0
1
```

Note - the mm-throughput-graph file plots the 95th percentile queueing delay. to plot with median queueing delay use the mm-throughput-graph file from this repo by placing it in /usr/bin





