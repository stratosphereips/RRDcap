# This tool is part of the Stratosphere Laboratory, AIC, FEL, CTU in Prague
# Contact: stratosphere@aic.fel.cvut.cz

PCAP_FILE=${args[--pcap]}
CONFIG_FILE=${args[--config]}

# Get RRD parameters from config file
rrd_step=$(config_get "STEP")
rrd_format=$(config_get "RRD_FORMAT")

echo "[+] Creating RRD file for packet capture: $PCAP_FILE"
echo "[+] RRD step configuration: $rrd_step"
echo "[+] RRD format configuration: $rrd_format"
