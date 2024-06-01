#!/bin/bash

ZIP_URL="https://prod-dcd-datasets-cache-zipfiles.s3.eu-west-1.amazonaws.com/n96ncsr5g4-1.zip"

OUTPUT_DIR="downloaded_files"
ZIP_FILE="$OUTPUT_DIR/n96ncsr5g4-1.zip"

mkdir -p $OUTPUT_DIR

echo "Downloading zip file from $ZIP_URL..."
curl -o $ZIP_FILE $ZIP_URL

if [ $? -ne 0 ]; then
  echo "Failed to download the zip file."
  exit 1
fi

echo "Extracting the zip file..."
unzip -d $OUTPUT_DIR $ZIP_FILE

if [ $? -ne 0 ]; then
  echo "Failed to extract the zip file."
  exit 1
fi

echo "Extracting zip files within the dataset directory..."
for file in $OUTPUT_DIR/n96ncsr5g4-1/dataset/*.zip; do
  unzip -d $OUTPUT_DIR/n96ncsr5g4-1/dataset $file
  rm $file
done

echo "Download, extraction, and cleanup complete."
