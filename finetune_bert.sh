export GLUE_DIR=/home/users/yitao/Code/PABEE/glue_data

if [ $3 == "run" ]
then
  python ./run_glue.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $1 \
    --do_train \
    --do_eval \
    --do_lower_case \
    --data_dir "$GLUE_DIR/$1" \
    --max_seq_length 128 \
    --per_gpu_train_batch_size 32 \
    --per_gpu_eval_batch_size 32 \
    --learning_rate 2e-5 \
    --save_steps $2 \
    --logging_steps $2 \
    --num_train_epochs 1 \
    --output_dir output \
    --overwrite_output_dir \
    --overwrite_cache \
    --evaluate_during_training
elif [ $3 == "eval" ]
then
    python ./run_glue.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $1 \
    --do_eval \
    --do_lower_case \
    --data_dir "$GLUE_DIR/$1" \
    --max_seq_length 128 \
    --per_gpu_train_batch_size 32 \
    --per_gpu_eval_batch_size 32 \
    --learning_rate 2e-5 \
    --save_steps $2 \
    --logging_steps $2 \
    --num_train_epochs 5 \
    --output_dir output \
    --overwrite_output_dir \
    --overwrite_cache \
    --evaluate_during_training
elif [ $3 == "debug" ]
then
  python -m pdb ./run_glue.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $1 \
    --do_train \
    --do_eval \
    --do_lower_case \
    --data_dir "$GLUE_DIR/$1" \
    --max_seq_length 128 \
    --per_gpu_train_batch_size 32 \
    --per_gpu_eval_batch_size 32 \
    --learning_rate 2e-5 \
    --save_steps $2 \
    --logging_steps $2 \
    --num_train_epochs 5 \
    --output_dir output \
    --overwrite_output_dir \
    --overwrite_cache \
    --evaluate_during_training
else
  echo "Run or Debug"
fi