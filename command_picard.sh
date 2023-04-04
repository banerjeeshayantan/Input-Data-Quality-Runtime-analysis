#Author: Shayantan Banerjee
#!/bin/sh
FILES="/home/shayantan/Desktop/GSOC23/SRA_data/*"
PICARD_PATH="/home/shayantan/Desktop/GSOC23/picard.jar"
REF_FILE="/home/shayantan/Desktop/GSOC23/hg19.fa"
OUTPUT_DIR="/home/shayantan/Desktop/GSOC23/QC_metrics_output/fastqc_output"
i=0
for file in $FILES
do	
	#running fastqc on each file stored in the SRA_data directory and storing the raw text output files in the directory fastqc_output
	fastqc $file --outdir $OUTPUT_DIR
	
	#dynamical naming of file variable
	OUTPUT_PICARD_DIR="/home/shayantan/Desktop/GSOC23/QC_metrics_output/picard_output/E${i}_file.tsv"
	OUTPUT_PICARD_DIR_CLEANED="/home/shayantan/Desktop/GSOC23/QC_metrics_output/picard_output/E${i}_file_cleaned.tsv"
	
	#running picard on each file stored in the SRA_data directory and storing the raw text output files in the directory picard_output
	java -jar $PICARD_PATH CollectAlignmentSummaryMetrics --INPUT $file --OUTPUT $OUTPUT_PICARD_DIR --REFERENCE_SEQUENCE $REF_FILE
	perl transpose.pl $OUTPUT_PICARD_DIR > $OUTPUT_PICARD_DIR_CLEANED
	
	i=$((i+1))



done
