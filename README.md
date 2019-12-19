# bert-ja-juman

## usage

### pull from docker

```terminal
$ make create-container
$ make
$ make jupyter
```

### docker build on your machine

```terminal
$ make create-image
$ make create-container
$ make
$ make jupyter
```

### validate

according to [https://dev.classmethod.jp/machine-learning/bert-text-embedding/]

1. access to [http://projector.tensorflow.org/]
2. upload; push load button and choose output.txt an input.txt
3. validate with t-SNE.

## work log

I almost write down work log to Dockerfile.

Some fixies to [bert](http://github.com/funwarioisii/bert).

1. `tf_upgrade_v2`
2. adapt tf2;
    - tf.flags -> tf.compat.v1.flags
    - tf.contrib.layers.layer_norm -> tf.keras.layers.LayerNormalization
3. change tokenizer to use Juman++

## reference
- http://nlp.ist.i.kyoto-u.ac.jp/index.php?BERT%E6%97%A5%E6%9C%AC%E8%AA%9EPretrained%E3%83%A2%E3%83%87%E3%83%AB
- https://dev.classmethod.jp/machine-learning/bert-text-embedding/
