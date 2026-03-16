#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

python CE_GZSL.py \
  --dataset SUN \
  --class_embedding att \
  --syn_num 100 \
  --batch_size 2048 \
  --attSize 102 \
  --nz 1024 \
  --embedSize 2048 \
  --outzSize 512 \
  --nhF 2048 \
  --ins_weight 0.001 \
  --cls_weight 0.001 \
  --ins_temp 0.1 \
  --cls_temp 0.1 \
  --manualSeed 3483 \
  --nclass_all 717 \
  --nclass_seen 645 \
  --gpus 0
