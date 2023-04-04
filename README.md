# Input-Data-Quality-Runtime-analysis

### Summary
This repository contains the code to programmatically extract data from the FASTQC and Picard outputs and convert it into a form that can be used to train machine learning models. There are a total of [10 bam files](https://drive.google.com/file/d/1payQg56p2bypY8DkaovO9yiCx6-2Pkig/view?usp=sharing) that has been used for this analysis. 

### Data 
Exome sequencing files from 10 chromosomes belonging to the dataset [SRR925780](https://trace.ncbi.nlm.nih.gov/Traces/index.html?view=run_browser&acc=SRR925780&display=metadata) was downloaded using the SRA Toolkit. Exome sequencing of a panel of breast cancer cell lines was performed to identify mutations and overall response to therapy. Overall design: 75 breast cancer cell lines underwent exome sequencing to identify mutations.

### Folder Description
**QC_metrics_output**: Consists of two directories fastqc_output and picard_output containing the outputs from the two QC tools obtained using the above 10 bam files as input.  

**fastqc_output**: Contains both the html and the raw text files named "fastqc_data.txt". This text file was parsed and several fields were aggregated into different dataframes for further ML analysis.  

**picard_output**: Contains the raw and the cleaned datafiles which was further formatted into standalone pandas dataframe.  

**Exploratory_analysis_fastqc_picard.ipynb**: The IPython notebook with step-by-step instructions to convert a fastqc/picard file dump to individual analysis-ready python dataframes. 

### File Description
**command_picard.sh**: shell script to loop through al 10 bam files and run FASTQC/Picard CollectAlignmentSummaryMetrics. The outputs are stored in separate directories QC_metrics_output/fastqc_output and QC_metrics_output/picard_output

**transpose.pl**: Cleans the output from picard CollectAlignmentSummaryMetrics. This code was adopted from this [online tutorial](https://davetang.org/muse/2014/07/26/getting-started-picard/). 







