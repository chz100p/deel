import sys
import os
import glob
import shutil

#labels
labels = os.listdir(sys.argv[1])

#make directries
os.mkdir("images")

#copy images and make train.txt
pwd = os.getcwd()
imageDir = os.path.join(pwd, "images")
train = open('train.txt','w')
train_lstm = open('train_lstm.tsv','w')
test = open('test.txt','w')
labelsTxt = open('labels.txt','w')

classNo=0
cnt = 0
#label = labels[classNo]
for label in labels:
	workdir = os.path.join(pwd, sys.argv[1], label)
	images = glob.glob(os.path.join(workdir, "*.jpg"))
	print(label)
	labelsTxt.write(label+"\n")
	startCnt=cnt
	length = len(images)
	for image in images:
		imagepath = os.path.join(imageDir, "image%07d.jpg" %cnt)
		shutil.copy(image, imagepath)
		if cnt-startCnt < length*0.75:
			train.write(imagepath+" %d\n" % classNo)
			train_lstm.write(imagepath+"\t%s\n" % label)
		else:
			test.write(imagepath+" %d\n" % classNo)
		cnt += 1
	
	classNo += 1

train.close()
test.close()
train_lstm.close()
labelsTxt.close()
