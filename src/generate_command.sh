# This tool is part of the Stratosphere Laboratory, AIC, FEL, CTU in Prague
# Contact: stratosphere@aic.fel.cvut.cz

PCAP_FILE=${args[--pcap]}
RRD_CONFIG=${args[--config]}

echo "[+] Creating RRD file for packet capture: $PCAP_FILE"
