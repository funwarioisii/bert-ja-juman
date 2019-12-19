all: init run

create-image:
	- docker build -t funwarioisii/bert-ja-juman .

create-container:
	- docker run --rm -it -p :8888 funwarioisii/bert-ja-juman bash

init:
	- git clone https://github.com/funwarioisii/bert

run:
	- python ./bert/extract_features.py \
	 	--input_file=input.txt \
	  	--output_file=output.jsonl \
	  	--vocab_file=$$BERT_BASE_DIR/vocab.txt \
	  	--bert_config_file=$$BERT_BASE_DIR/bert_config.json \
	  	--init_checkpoint=$$BERT_BASE_DIR/bert_model.ckpt \
	  	--do_lower_case False
	- python convert.py

jupyter:
	jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token=''
