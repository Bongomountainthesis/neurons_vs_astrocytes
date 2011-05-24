#!/usr/local/bin/Rscript

ns.neurons<-read.csv("results/limma_results.csv")

ns.neurons.ordered<-ns.neurons[order(abs(ns.neurons[,10]), decreasing=TRUE), ]

ns.neurons.nodup<-ns.neurons.ordered[!duplicated(ns.neurons.ordered[,2]),]

ns.neurons.pcutoff<-ns.neurons.nodup[ns.neurons[, 14] <= 0.001,]


ns.neurons.up<-ns.neurons.pcutoff[ns.neurons.pcutoff[,10] >=1,]

ns.neurons.down<-ns.neurons.pcutoff[ns.neurons.pcutoff[,10] <=-1,]

ns.neurons.changing<-ns.neurons.pcutoff[abs(ns.neurons.pcutoff[,10]) >=1,]

write.csv(ns.neurons.changing, file="results/nsneuronschanging.csv")
