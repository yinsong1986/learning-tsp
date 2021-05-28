#!/bin/bash
CUDA_VISIBLE_DEVICES=0 time python run.py \
  --problem tsp \
  --model attention \
  --encoder gnn \
  --baseline rollout \
  --min_size 20 \
  --max_size 50 \
  --batch_size 128 \
  --train_dataset data/tsp/tsp20-50_train_concorde.txt \
  --val_datasets data/tsp/tsp20_test_concorde.txt data/tsp/tsp50_test_concorde.txt data/tsp/tsp100_test_concorde.txt \
  --lr_model 1e-4 \
  --run_name tsp_attention_gnn_rollout \
  --gated \
  --val_size 1280 \
  --n_epochs 1 \
  --max_steps 1000
