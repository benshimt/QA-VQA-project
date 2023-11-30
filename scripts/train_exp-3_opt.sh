# #!/bin/bash
  
# log_directory="log/exp-3"
# if [ ! -d "$log_directory" ]; then
#   mkdir -p "$log_directory"
#   echo "build log_directory successfully"
# fi

# token_loss=0
# echo "$model_name" ################ we added
# for model_name in "$@facebook/opt-1.3b", "facebook/opt-2.7b", "facebook/opt-350m"; ################ we changed from 2.7
# do

# if [[ $model_name == *"/"* ]]; then
#     model_name_for_log=$(echo "$model_name" | sed 's/\//-/g')
# else
#     model_name_for_log="$model_name"
# fi

# time_stamp=$(date "+%Y-%m-%d_%H-%M-%S")
#     for scale in 1187 256 32;
#     do
#     if [ $scale -eq 32 ]; then
#         lr=5e-6
#         epoch=16
#         batch_size=8
#     elif [ $scale -eq 256 ]; then
#         lr=3e-6
#         epoch=12
#         batch_size=8 #32
#     elif [ $scale -eq 1187 ]; then
#         lr=6e-6
#         epoch=8
#         batch_size=8 #32
#     fi
#         for seed in 4 13 34;
#         do
#         CUDA_VISIBLE_DEVICES=0,1,2,3 python src/exp-3_opt.py --model_name=$model_name \
#                                             --seed=$seed \
#                                             --time_stamp=$time_stamp \
#                                             --epoch=$epoch --lr=$lr --scale=$scale \
#                                             --batch_size=$batch_size \
#                                             --token_loss=$token_loss >> "log/exp-3/$time_stamp"_"train_exp-3_scale"-"$scale"_"$model_name_for_log"_$seed".log" 2>&1
#         done
#     done
# done


#!/bin/bash
 
log_directory="log/exp-3"
if [ ! -d "$log_directory" ]; then
  mkdir -p "$log_directory"
  echo "build log_directory successfully"
fi
 
token_loss=0
 
# Check if the --model_names argument is provided
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 --model_names model1 model2 ... --epoch <epoch_value> --batch_size <batch_size_value>"
  exit 1
fi
 
# Iterate over command-line arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    --model_names)
      shift
      # Iterate over model names passed as command-line arguments
      for model_name in "$@"; do
        if [[ $model_name == *"/"* ]]; then
          model_name_for_log=$(echo "$model_name" | sed 's/\//-/g')
        else
          model_name_for_log="$model_name"
        fi
 
        time_stamp=$(date "+%Y-%m-%d_%H-%M-%S")
 
        for scale in 1187 256 32; do
          if [ $scale -eq 32 ]; then
            lr=5e-6
            epoch=16
            batch_size=8
          elif [ $scale -eq 256 ]; then
            lr=3e-6
            epoch=12
            batch_size=32
          elif [ $scale -eq 1187 ]; then
            lr=6e-6
            epoch=8
            batch_size=32
          fi
 
          for seed in 4 13 34; do
            CUDA_VISIBLE_DEVICES=0,1,2,3 python src/exp-3_opt.py --model_name=$model_name \
                                            --seed=$seed \
                                            --time_stamp=$time_stamp \
                                            --epoch=$epoch --lr=$lr --scale=$scale \
                                            --batch_size=$batch_size \
                                            --token_loss=$token_loss >> "log/exp-3/$time_stamp"_"train_exp-3_scale"-"$scale"_"$model_name_for_log"_$seed".log" 2>&1
          done
        done
      done
      shift $#
      ;;
    --epoch)
      shift
      epoch="$1"
      shift
      ;;
    --batch_size)
      shift
      batch_size="$1"
      shift
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done
