import os
import sys
import matplotlib.pyplot as plt
from skimage import io
from skimage import feature

args = sys.argv
folder = args[1] + '/'
grayImagesFolder = '../grayImages/'
fullImagesPath = grayImagesFolder + folder
fullColorImagesPath = '../originalImages/' + folder
fullCutScenesPath = '../cutScenes/' + folder + 'edgeDifference/'
graphName = 'edgeDifferenceGraph' + args[1]
rate = int(args[3])
T = float(args[2])
xAxis = []
yAxis = []

def cleanFolder(folder):
  for fileName in os.listdir(folder):
    filePath = os.path.join(folder, fileName)
    os.unlink(filePath)

def copyCutScenes(cutScenes):
    cleanFolder(fullCutScenesPath)
    count = 1
    for image in cutScenes:
      img = io.imread(fullColorImagesPath + image)
      for index in range(rate):
        imageName = '%04d' % count + '.png'
        count = count + 1
        io.imsave(fullCutScenesPath + imageName, img)

def isCutScene(previousFrame, nextFrame, index): # two-dimentional array
  previousFrameEdges = feature.canny(previousFrame)
  nextFrameEdges = feature.canny(nextFrame)
  
  prvEdgesCount = previousFrameEdges.astype(int)
  prvEdgesCount = len(prvEdgesCount[prvEdgesCount == 1])
  if prvEdgesCount == 0:
    prvEdgesCount = 1
  
  nxtEdgesCount = nextFrameEdges.astype(int)
  nxtEdgesCount = len(nxtEdgesCount[nxtEdgesCount == 1])
  if nxtEdgesCount == 0:
    nxtEdgesCount = 1
    
  edgeRelation = min(prvEdgesCount, nxtEdgesCount) / float(max(prvEdgesCount, nxtEdgesCount))
  
  xAxis.append(index)
  yAxis.append(edgeRelation)
  
  return edgeRelation < T

def saveGraph(limiar):
  fig = plt.figure()
  plt.plot(xAxis, yAxis)
  plt.plot(xAxis, [limiar] * len(xAxis))
  plt.xlabel('frames')
  plt.ylabel('edge difference ratio')
  plt.legend(['Frame difference', 'Limiar'], loc=4)
  fig.savefig('tmp/' + graphName + '.png')

def main():
  cutScenes = []
  files = sorted(os.listdir(fullImagesPath))
  cutScenes.append(files[0]) # the first scene start the process of comparison
  for index in range(len(files) - 1):
  #for index in range(49):
    frame1 = io.imread(fullImagesPath + files[index])
    frame2 = io.imread(fullImagesPath + files[index + 1])
    if isCutScene(frame1, frame2, index + 1):
      cutScenes.append(files[index + 1])
  
  print cutScenes
  copyCutScenes(cutScenes)
  saveGraph(T)
  
main()
