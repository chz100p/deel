if not exist "bvlc_googlenet.caffemodel" (
  curl -O http://dl.caffe.berkeleyvision.org/bvlc_googlenet.caffemodel
)
if not exist "bvlc_alexnet.caffemodel" (
  curl -O http://dl.caffe.berkeleyvision.org/bvlc_alexnet.caffemodel
)
if not exist "ilsvrc_2012_mean.npy" (
  curl -O https://github.com/BVLC/caffe/raw/master/python/caffe/imagenet/ilsvrc_2012_mean.npy
)
