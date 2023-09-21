CUDA_VISIBLE_DEVICES=0 accelerate launch --config_file "src/models/configs/config_defaultMultiGPU.yaml" train.py \
        --lora_r 8 \
        --model_name_or_path gpt2-large \
        --max_train_samples 1000 \
        --max_eval_samples 500 \
        --train_batch_size 4 \
        --val_file "src/data/features/final_storge_converted/yahma_alpaca-cleaned/AlpacaCleaned_translatedFormated.json" "src/data/features/final_storge_converted/yahma_alpaca-cleaned/AlpacaCleanedFormated.json" \
        --num_epochs 2 \
        --model_type CAUSAL_LM \
        --gradient_accumulation_steps 32 \
        --better_transformer \
        --eval_batch_size 6 \
        --lora_alpha 32 \
        --Optim_name PagedLion8bit \
        --enable_model_offload \
        --gradient_checkpointing \
        --do_eval \
        --use_8bit \
        --do_generate_eval \
        --llm_int8_enable_fp32_cpu_offload \
        --max_model_shard_size 200MB \
        --num_beams 1 \
        --no_early_stopping \
        --merge_weight_eval \
        --deep_speed_inf \
        --print_model_key \
        --shard_model