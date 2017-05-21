import os
import sys
import matplotlib.pyplot as plt
from skimage import io
import numpy as np

args = sys.argv
folder = args[1] + '/'
grayImagesFolder = '../grayImages/'
fullImagesPath = grayImagesFolder + folder
fullColorImagesPath = '../originalImages/' + folder
fullCutScenesPath = '../cutScenes/' + folder + 'histogramDifference/'
graphName = 'histogramDifferenceGraph' + args[1]
alpha = float(args[2])
rate = int(args[3])
numberBins = int(args[4])
allDifferences = []
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

def computeHistogramDifference(previousFrame, nextFrame):
  previousFrameHistogram = np.histogram(previousFrame, numberBins)[0]
  nextFrameHistogram = np.histogram(nextFrame, numberBins)[0]
  
  differences = []
  for index in range(numberBins):
    differences.append(abs(int(previousFrameHistogram[index]) - int(nextFrameHistogram[index])))
    
  allDifferences.append(np.sum(differences))

def isCutScene(difference, limiar):
  return difference > limiar

def saveGraph(limiar):
  fig = plt.figure()
  plt.plot(xAxis, yAxis)
  plt.plot(xAxis, [limiar] * len(xAxis))
  plt.xlabel('frames')
  plt.ylabel('histogram difference')
  plt.legend(['Frame difference', 'Limiar'], loc='upper left')
  fig.savefig('tmp/' + graphName + '.png')

def main():
  cutScenes = []
  
  files = sorted(os.listdir(fullImagesPath))
  cutScenes.append(files[0]) # the first scene start the process of comparison
  for index in range(len(files) - 1):
  #for index in range(50):
    frame1 = io.imread(fullImagesPath + files[index])
    frame2 = io.imread(fullImagesPath + files[index + 1])
    computeHistogramDifference(frame1, frame2)
  
  meanAllDifferences = np.mean(allDifferences)
  stdAllDifferences = np.std(allDifferences)
  limiar = meanAllDifferences + (alpha * stdAllDifferences)
  print limiar
  print allDifferences
  
  #check for cut scenes
  for index in range(len(allDifferences)):
    xAxis.append(index)
    yAxis.append(allDifferences[index])  
    if isCutScene(allDifferences[index], limiar):
      cutScenes.append(files[index + 1])
  
  print cutScenes
  copyCutScenes(cutScenes)
  saveGraph(limiar)
      
main()
