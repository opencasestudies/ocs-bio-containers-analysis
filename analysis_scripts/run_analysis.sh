#!/bin/bash

echo "Extracting data"

mkdir -p ../results/logs

Rscript 01_extract_data.R >> ../results/logs/data_extraction_logs.txt

echo "Wrangling data"

Rscript 02_wrangle.R >> ../results/logs/wrangling_logs.txt

echo "Visualizing data"

Rscript 03a_visualization.R >> ../results/logs/visualization_logs.txt

Rscript 03b_visualization_patchwork.R >> ../results/logs/visualization_logs.txt

echo "Process complete"

Rscript -e 'sessionInfo()' >> ../results/logs/session_info.txt
