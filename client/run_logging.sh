#Edit values according to length of the experiment
INTERVAL=10
TIMES=72

sudo sar $INTERVAL $TIMES >cpu.log &
sudo sar -r $INTERVAL $TIMES >mem.log &
sudo sar -F $INTERVAL $TIMES >disk.log &
