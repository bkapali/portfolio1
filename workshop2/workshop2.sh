#bash script for desired output

space="$(printf '%0.1s' -{1..30})"
echo "${space// /-} System Report ${space// /-}" > workshop2_output.txt

(
	printf "Date: $(date +%d/%m/%Y)\tTime: $(date +%T)\tHost Name $(hostname)\n"
)| column -t -s $'\t' >> workshop2_output.txt
