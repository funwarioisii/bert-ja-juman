import json
import numpy as np
 
# 参照するレイヤーを指定する
TARGET_LAYER = -2
 
# 参照するトークンを指定する
SENTENCE_EMBEDDING_TOKEN = '[CLS]'
 
with open('output.jsonl', 'r') as f:
    output_jsons = f.readlines()
 
embedding_list = []
for output_json in output_jsons:
    output = json.loads(output_json)
    for feature in output['features']:
        if feature['token'] != SENTENCE_EMBEDDING_TOKEN: continue
        for layer in feature['layers']:
            if layer['index'] != TARGET_LAYER: continue
            embedding_list.append(layer['values'])
 
np.savetxt('output.tsv', embedding_list, delimiter='\t')
