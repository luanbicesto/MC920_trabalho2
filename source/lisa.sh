#!/bin/bash

#pixel difference approach
#clean final folder
#rm -rf ../finalVideos/lisa/lisaPixel.mp4
#python pixelDifference.py lisa 33 3 1
#avconv -f image2 -i ../cutScenes/lisa/pixelDifference/%04d.png -r 30 tmp/lisaPixel.mp4

#block difference approach
#clean final folder
#rm -rf ../finalVideos/lisa/lisaBlock.mp4
#python blockDifference.py lisa 81 5 1
#avconv -f image2 -i ../cutScenes/lisa/blockDifference/%04d.png -r 12 tmp/lisaBlock.mp4

#histogram difference approach
#clean final folder
#rm -rf ../finalVideos/lisa/lisaHistogram.mp4
#python histogramDifference.py lisa 0.1 1 128 #folder alpha rate numberBins
#avconv -f image2 -i ../cutScenes/lisa/histogramDifference/%04d.png -r 30 tmp/lisaHistogram.mp4

#edge approach
#clean final folder
rm -rf ../finalVideos/lisa/lisaEdge.mp4
python edgeDifference.py lisa 0.96 1
avconv -f image2 -i ../cutScenes/lisa/edgeDifference/%04d.png -r 30 tmp/lisaEdge.mp4

#move all files to final folder
mv tmp/*.* ../finalVideos/lisa/
