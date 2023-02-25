# This tool is part of the Stratosphere Laboratory, AIC, FEL, CTU in Prague
# Contact: stratosphere@aic.fel.cvut.cz

CONFIG_FILE=${args[--config]}
PCAP_FILE=${args[--pcap]}
OUTPUT_FILE=${args[--output]}

echo "[+] Generating Argus binary files for pcap: $PCAP_FILE"

argus -F "$CONFIG_FILE" -r "$PCAP_FILE" -w "$OUTPUT_FILE"

if eval validate_file_exists "$OUTPUT_FILE" && ! eval validate_not_empty "$OUTPUT_FILE";
then
    echo "[+] Saved .biargus file: $OUTPUT_FILE"
else
    echo "[!] An error occurred generating the biargus file"
fi
