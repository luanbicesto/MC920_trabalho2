#!/bin/bash

#pixel difference approach
#clean final folder
#rm -rf ../finalVideos/umn/umnPixel.mp4
#python pixelDifference.py umn 9 5 1
#avconv -f image2 -i ../cutScenes/umn/pixelDifference/%04d.png -r 30 tmp/umnPixel.mp4

#block difference approach
#clean final folder
#rm -rf ../finalVideos/umn/umnBlock.mp4
#python blockDifference.py umn 81 3 1
#avconv -f image2 -i ../cutScenes/umn/blockDifference/%04d.png -r 12 tmp/umnBlock.mp4

#histogram difference approach
#clean final folder
#rm -rf ../finalVideos/umn/umnHistogram.mp4
#python histogramDifference.py umn 0.5 1 128 #folder alpha rate numberBins
#avconv -f image2 -i ../cutScenes/umn/histogramDifference/%04d.png -r 30 tmp/umnHistogram.mp4

#edge approach
#clean final folder
rm -rf ../finalVideos/umn/umnEdge.mp4
python edgeDifference.py umn 0.98 2
avconv -f image2 -i ../cutScenes/umn/edgeDifference/%04d.png -r 30 tmp/umnEdge.mp4

#move all files to final folder
mv tmp/*.* ../finalVideos/umn/
