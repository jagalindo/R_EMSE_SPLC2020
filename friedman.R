
all_data <- read_csv("all.csv")
all_data$Algorithm<-factor(all_data$Algorithm)
all_data$metric<-factor(all_data$metric)
all_data$Entropy<-factor(all_data$Entropy)
all_data$experiment<-factor(all_data$experiment)
all_data$ID <- seq.int(nrow(all_data))
density_data =subset(all_data, metric == 'Density' & experiment == 'erp')

table(density_data$ID,density_data$Algorithm)


aggregate(x=density_data$value,by=list(density_data$Algorithm, density_data$Entropy),FUN=median)
aggregate(x=all_data$value,by=list(all_data$Algorithm, all_data$Entropy,all_data$experiment),FUN=median)

friedman.test(value ~ Algorithm|ID, density_data)
