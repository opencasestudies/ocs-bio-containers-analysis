#!/bin/bash

echo "Extracting data"

mkdir -p ../results/logs

Rscript 01_extract_data.R > ../results/logs/data_extraction_logs.txt

echo "Wrangling data"

Rscript 02_wrangle.R > ../results/logs/wrangling_logs.txt

echo "Visualizing data"

Rscript 03b_visualization_patchwork.R

echo "Process complete"

Rscript 'sessionInfo()' > ../results/logs/session_info.txt
