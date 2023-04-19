
CUDA_VISIBLE_DEVICES=0 fairseq-train \
    data-bin/iwslt14.tokenized.de-en \
    --arch transformer_iwslt_de_en \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --max-tokens $((4096 + 4096)) \
    # --eval-bleu \
    # --eval-bleu-args '{"beam": 5, "max_len_a": 1.2, "max_len_b": 10}' \
    # --eval-bleu-detok moses \
    # --eval-bleu-remove-bpe \
    # --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    # ` ` \
    # --wandb-project CoVoST_downstream \
    # --log-file log_LocalTest__ckpt__$(date +"%Y%m%d_%H%M%S") \
    # --save-dir \
      # LocalTest__ckpt__$(date +"%Y%m%d_%H%M%S") \
      # --max-epoch 200
