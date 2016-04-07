if exist "101_ObjectCategories\" rmdir /S /Q "101_ObjectCategories\"
if exist "images\" rmdir /S /Q "images\"
if exist "test.txt" del "test.txt"
if exist "train.txt" del "train.txt"
if exist "train_lstm.tsv" del "train_lstm.tsv"
if exist "_images\" rmdir /S /Q "_images\"
if exist "mean.npy" del "mean.npy"

if not exist "101_ObjectCategories.tar.gz" (
  curl -O http://www.vision.caltech.edu/Image_Datasets/Caltech101/101_ObjectCategories.tar.gz
)
tar xzvf 101_ObjectCategories.tar.gz
python make_train_data.py 101_ObjectCategories
move images _images
cd _images
python ..\resize.py *
move resized ..\images
cd ..
python compute_mean.py train.txt
