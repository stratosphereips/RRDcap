# This tool is part of the Stratosphere Laboratory, AIC, FEL, CTU in Prague
# Contact: stratosphere@aic.fel.cvut.cz

RACONFIG_FILE=${args[--config]}
BIGARGUS_FILE=${args[--biargus]}

RRD_FILE=${args[--rrd]}

echo "[+] Updating $RRD_FILE with data from $BIGARGUS_FILE"

ra -F "$RACONFIG_FILE" -n -Z b -r "$BIARGUS_FILE" | BotSummarizer.py -l -w 1 -r "$RRDFILE" -f - | rrdtool -

if eval validate_file_exists "$RRD_FILE";
then
    echo "[+] Finished updating: $RRD_FILE"
else
    echo "[!] An error occurred updating the RRD file"
fi
