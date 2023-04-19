
CUDA_VISIBLE_DEVICES=0 fairseq-train \
    data-bin/jeff.tokenized.un-de \
    --arch transformer_iwslt_de_en \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --max-tokens 8192 \
    --eval-bleu \
    --eval-bleu-args '{"beam": 8, "max_len_a": 0.6, "max_len_b": 20}' \
    --eval-bleu-detok moses \
    --eval-bleu-remove-bpe \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    ` ` \
    --wandb-project CoVoST_downstream \
    --log-file log_LocalCovost__ckpt__$(date +"%Y%m%d_%H%M%S") \
    --save-dir \
      LocalCovost__ckpt__$(date +"%Y%m%d_%H%M%S") \
      --max-epoch 200
: <<-HERE
/storage/LabJob/Projects/ToolkitLearn/fairseq_new/fairseq/fairseq/tasks/fairseq_task.py

                print('\033[01;31m')
                print(
                    "sample['id'] =",
                    sample['id'],
                )
                print(
                    "sample['nsentences'] =",
                    sample['nsentences'],
                )
                print(
                    "sample['ntokens'] =",
                    sample['ntokens'],
                )
                print(
                    "sample['net_input'] =",
                    sample['net_input'],
                )
                print(
                    "sample['target'] =",
                    sample['target'],
                )
                print('\033[0m')
HERE
