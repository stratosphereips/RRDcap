# This tool is part of the Stratosphere Laboratory, AIC, FEL, CTU in Prague
# Contact: stratosphere@aic.fel.cvut.cz

RRD_FILE=${args[--rrd]}
OUTPUT_FILE=${args[--output]}

# Get RRD parameters from config file
rrd_width=$(config_get "RRD_WIDTH")
rrd_height=$(config_get "RRD_HEIGHT")
rrd_img_format=$(config_get "RRD_IMGFORMAT")
rrd_start=$(config_get "RRD_START")
rrd_end=$(config_get "RRD_END")
rrd_graph=$(config_get "RRD_GRAPH")

rrd_graph=$(echo "$rrd_graph" | awk -v repl="$RRD_FILE" '{gsub(/RRDFILENAME/,repl)}1')

echo "[+] Creating RRD graph: $OUTPUT_FILE"

rrdtool graph "$OUTPUT_FILE" -w "$rrd_width" -h "$rrd_height" \
    --imgformat "$rrd_img_format" --start "$rrd_start" \
    --end "$rrd_end" $rrd_graph 1>/dev/null

if eval validate_file_exists "$OUTPUT_FILE" && ! eval validate_not_empty "$OUTPUT_FILE";
then
    echo "[+] Saved RRD graph: $OUTPUT_FILE"
else
    echo "[!] An error occurred generating the RRD graph"
fi
