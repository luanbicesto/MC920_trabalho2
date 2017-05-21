from skimage import color
from skimage.color import rgb2gray
from skimage import io
import os

originalImagesFolder = '../originalImages/'
grayImagesFolder = '../grayImages/'

def checkGrayDirectory(folder):
  pathFolder = grayImagesFolder + folder
  if not os.path.isdir(pathFolder):
    os.makedirs(pathFolder)
    
def main():
  folders = ['umn']

  for folder in folders:
    for image in os.listdir(originalImagesFolder + folder):
      checkGrayDirectory(folder)
      img = color.rgb2gray(io.imread(originalImagesFolder + folder + '/' + image))
      io.imsave(grayImagesFolder + folder + '/' + image, img)

main()
