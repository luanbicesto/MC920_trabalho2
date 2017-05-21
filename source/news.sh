#!/bin/bash

#pixel difference approach
#clean final folder
#rm -rf ../finalVideos/news/newsPixel.mp4
#python pixelDifference.py news 9 50 1
#avconv -f image2 -i ../cutScenes/news/pixelDifference/%04d.png -r 30 tmp/newsPixel.mp4

#block difference approach
#clean final folder
#rm -rf ../finalVideos/news/newsBlock.mp4
#python blockDifference.py news 81 15 1
#avconv -f image2 -i ../cutScenes/news/blockDifference/%04d.png -r 12 tmp/newsBlock.mp4

#histogram difference approach
#clean final folder
#rm -rf ../finalVideos/news/newsHistogram.mp4
#python histogramDifference.py news 0.5 1 240 #folder alpha rate numberBins
#avconv -f image2 -i ../cutScenes/news/histogramDifference/%04d.png -r 30 tmp/newsHistogram.mp4

#edge approach
#clean final folder
rm -rf ../finalVideos/news/newsEdge.mp4
python edgeDifference.py news 0.99 1
avconv -f image2 -i ../cutScenes/news/edgeDifference/%04d.png -r 30 tmp/newsEdge.mp4

#move all files to final folder
mv tmp/*.* ../finalVideos/news/
