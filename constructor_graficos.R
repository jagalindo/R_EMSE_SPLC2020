remove(list = ls())
library(tidyverse)
library(fmsb)
library(ggplot2)


spider_dat <- read_csv("sipder_notepad.csv")
sapply(spider_dat, class)
data <- spider_dat[,2:6]
rownames(data) <- c("ERP", "Smart Farm", "Computer Configuration")
data <- rbind(rep(1605,5) , rep(0,5) , data)

colors_border=c( rgb(0,0.6,0.5,0.9), rgb(0.95,0.90,0.25,0.9) , rgb(1,0,0,0.9) )
colors_in=c( rgb(0,0.6,0.5,0.4), rgb(0.95,0.90,0.25,0.4) , rgb(1,0,0,0.4) )



radarchart(data,pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
           cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
           vlcex=0.8 )

legend(x=1.2, y=1, legend = c("ERP", "Smart Farm", "Computer Configuration"), bty = "n", pch=20 , 
       col=colors_in , text.col = "black", cex=0.9, pt.cex=3)



#Para los boxplot

variety=rep(LETTERS[1:7], each=40)
treatment=rep(c("high","low"),each=20)
note=seq(1:280)+sample(1:150, 280, replace=T)
data_bp=data.frame(variety, treatment ,  note)

boxplot_erp_data <- read_csv("ERP todo boxplot .csv")
ggplot(boxplot_erp_data, aes(x=Algorithm, y=value, fill=metric)) + geom_boxplot()+ scale_y_continuous(trans = 'log2')


ggplot(boxplot_erp_data, aes(fill=algorithm, y=value, x=algorithm)) + 
  geom_bar(position="dodge", stat="identity") + scale_y_continuous(trans = 'log2') + facet_wrap(~metric)


ggplot(boxplot_erp_data, aes(fill=Entropy, y=value, x=Algorithm)) + 
  geom_boxplot() + scale_y_continuous(trans = 'log2') + facet_wrap(~metric)+ scale_color_brewer(palette = "Paired")+ scale_fill_manual(values=c("#5dade2", "#eb984e", "#56B4E9"))
  

boxplot_farming_data <- read_csv("Farming todo boxplot  .csv")
ggplot(boxplot_farming_data, aes(y=value, x=Algorithm)) + geom_boxplot(fill="#5dade2") + scale_y_continuous(trans = 'log2') + facet_wrap(~metric)


boxplot_dell_data <- read_csv("Dell todo boxplot.csv")
ggplot(boxplot_dell_data, aes(fill=Entropy, y=value, x=Algorithm)) + 
  geom_boxplot() + scale_y_continuous(trans = 'log2') + facet_wrap(~metric) + scale_color_brewer(palette = "Paired")+ scale_fill_manual(values=c("#5dade2", "#eb984e", "#56B4E9"))


