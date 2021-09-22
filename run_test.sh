#!/bin/sh

# gen vocabs for medical
# office
DATA_PATH="/data/tianmu/Projects/medicalai/nanyibigdata/ChineseNER/data/medical_v0916_newlstm"

# home
DATA_PATH="/home/mtian/Projects/medicalai/nanyibigdata/ChineseNER/data/medical_v0916_newlstm"

# train
python vocab.py ${DATA_PATH}/train.txt ${DATA_PATH}/sent_vocab_train.json ${DATA_PATH}/tag_vocab_train.json

# test
python vocab.py ${DATA_PATH}/test.txt ${DATA_PATH}/sent_vocab_test.json ${DATA_PATH}/tag_vocab_test.json

# training medical
# train on train
python run.py train ${DATA_PATH}/train.txt ${DATA_PATH}/sent_vocab_train.json ${DATA_PATH}/tag_vocab_train.json --cuda \
--max-epoch 50 --model-save-path ${DATA_PATH}/model.pth  --optimizer-save-path ${DATA_PATH}/optimizer.pth

# test on test
python run.py test ${DATA_PATH}/test.txt ${DATA_PATH}/result_test.txt  ${DATA_PATH}/sent_vocab_train.json ${DATA_PATH}/tag_vocab_train.json ${DATA_PATH}/model.pth


# test on train
python run.py test ${DATA_PATH}/train.txt ${DATA_PATH}/result_train.txt  ${DATA_PATH}/sent_vocab_train.json ${DATA_PATH}/tag_vocab_train.json ${DATA_PATH}/model.pth