#!/bin/bash

#pixel difference approach
#clean final folder
#rm -rf ../finalVideos/xylophone/xylophonePixel.mp4
#python pixelDifference.py xylophone 9 6 1
#avconv -f image2 -i ../cutScenes/xylophone/pixelDifference/%04d.png -r 30 tmp/xylophonePixel.mp4

#block difference approach
#clean final folder
#rm -rf ../finalVideos/xylophone/xylophoneBlock.mp4
#python blockDifference.py xylophone 81 2 1
#avconv -f image2 -i ../cutScenes/xylophone/blockDifference/%04d.png -r 30 tmp/xylophoneBlock.mp4

#histogram difference approach
#clean final folder
#rm -rf ../finalVideos/xylophone/xylophoneHistogram.mp4
#python histogramDifference.py xylophone 0.1 1 128 #folder alpha rate numberBins
#avconv -f image2 -i ../cutScenes/xylophone/histogramDifference/%04d.png -r 30 tmp/xylophoneHistogram.mp4

#edge approach
#clean final folder
rm -rf ../finalVideos/xylophone/xylophoneEdge.mp4
python edgeDifference.py xylophone 0.985 1
avconv -f image2 -i ../cutScenes/xylophone/edgeDifference/%04d.png -r 30 tmp/xylophoneEdge.mp4

#move all files to final folder
mv tmp/*.* ../finalVideos/xylophone/
