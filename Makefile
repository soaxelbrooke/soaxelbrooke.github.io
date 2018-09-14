
vectors_50d.txt:
	fasttext skipgram -input shuffled_review_bodies.txt -output lm -dim 50
	rm lm.bin
	mv lm.vec vectors_50d.txt

tfjs_model/:
	tensorflowjs_converter --input_format=keras keras_model.hdf5 tfjs_model


.PHONY: upload-model
upload-model:
	gsutil rm -rf gs://axelbrooke-public/tmp/tfjs_model/ && gsutil cp -r tfjs_model/ gs://axelbrooke-public/tmp/
