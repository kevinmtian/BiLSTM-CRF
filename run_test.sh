#!/bin/sh

# gen vocabs for medical

DATA_PATH="/data/tianmu/Projects/medicalai/nanyibigdata/ChineseNER/data/medical_v0916_newlstm"

# train
python vocab.py ${DATA_PATH}/train.txt ${DATA_PATH}/sent_vocab_train.json ${DATA_PATH}/tag_vocab_train.json

# test
python vocab.py ${DATA_PATH}/test.txt ${DATA_PATH}/sent_vocab_test.json ${DATA_PATH}/tag_vocab_test.json

# training medical
# train on train
python run.py train ${DATA_PATH}/train.txt ${DATA_PATH}/sent_vocab_train.json ${DATA_PATH}/tag_vocab_train.json --cuda --max-epoch 50