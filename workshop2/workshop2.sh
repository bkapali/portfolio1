#bash script for desired output

space="$(printf '%0.1s' -{1..30})"
echo "${space// /-} System Report ${space// /-}" > workshop2_output.txt

(
	printf "Date: $(date +%d/%m/%Y)\tTime: $(date +%T)\tHost Name $(hostname)\n"
)| column -t -s $'\t' >> workshop2_output.txt

underline="$(printf '%0.1s' -{1..75})"
echo "${underline// /-}" >> workshop2_output.txt

uptime | awk -F'( |,|:)+' '{print "Uptime: ",$4,$5,",",$6,"hours,",$7,"minutes"}' >> workshop2_output.txt
uptime | awk -F'( |,|:)+' '{print "Current Users: ",$8}' >> workshop2_output.txt

top -l 1 | head -n 10 | grep PhysMem | sed 's/, /n /g' | awk '{print "Memory Utilisation: ", substr($4,2)/$2*100,"%"}' >> workshop2_output.txt
uptime | awk '{print "CPU Load: ",$10}' >> workshop2_output.txt
