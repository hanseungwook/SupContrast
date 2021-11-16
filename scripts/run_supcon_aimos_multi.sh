#!/bin/bash

## User python environment
HOME2=/gpfs/u/home/BNSS/BNSSsgwh
PYTHON_VIRTUAL_ENVIRONMENT=pytorch1.7
CONDA_ROOT=$HOME2/barn/miniconda3

## Activate WMLCE virtual environment 
source ${CONDA_ROOT}/etc/profile.d/conda.sh
conda activate $PYTHON_VIRTUAL_ENVIRONMENT
ulimit -s unlimited

python \
      $HOME2/scratch/test/SupContrast/main_dist_multi.py \
      --data /gpfs/u/locker/200/CADS/datasets/ImageNet/train/ \
      --workers 16 \
      --nodes 4 \
      --ngpus 6 \
      --epochs 800 \
      --batch-size 1536 \
      --learning-rate 1.2 \
      --temp 0.1 \
      --print-freq 50 \
      --checkpoint-dir $HOME2/scratch/test/SupContrast/results/ \
      --top5-path $HOME2/scratch/test/SupContrast/imagenet_resnet50_top10.pkl \
      --log-dir $HOME2/scratch/test/SupContrast/logs/ \
      --name supcon-negboost-imagenet-multi-top5mask

echo "Run completed at:- "
date

