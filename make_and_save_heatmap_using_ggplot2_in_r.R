# Sample data download
# https://github.com/coldbrew0806/R_tips
# https://github.com/coldbrew0806/R_tips/blob/master/test.csv

# if you don't have ggplot2, install.packages("ggplot2")
library("ggplot2")

# csvfile path ( \ => / ) 
fpath = "C:/Users/coldbrew/Downloads/test.csv"

#read csvfile
dat = read.csv(fpath)

#confirm data
print(dat)

#confirm data's colnames
print(colnames(dat))

# xval = x-axis data
# yval = y-axis data
# fill_value = The values that make up the color in the heatmap
# fill_label = The label that matches fill_value or the nickname of fill_value

########make heatmap plot (geom_tile) start########

#step1 - default
a<- ggplot(dat, aes(x=xval, y=yval, fill=fill_value, label=fill_label))+
  geom_tile()

#step2 - set colors of scale_fill_gradient
a<-a +scale_fill_gradient(high="red", low="yellow")

#step3 - set fill_label's font size 
a<-a + geom_text(size=5 )

#step4 - set Order of x-axis values
#change c("a", "b", "c", "d") to c("b", "c", "a", "d")
a<-a + scale_x_discrete(limits= c("b", "c", "a", "d"))

#step5 - set plot's background style
#Other types - http://www.sthda.com/english/wiki/ggplot2-themes-and-background-colors-the-3-elements
a<- a + theme_light()

#step6 - set basic titles (main, x-axis, y-axis, lengend)
a<- a + ggtitle("main-title")
a<- a+xlab("xlab-name")
a<- a+ylab("ylab-name")
a<- a + labs(fill = "legend-name")

#step7 - set main text's font style (color, font size, face)
a<- a+ theme(text = element_text(color = "black", size=15, face = "bold"))

#step8 - set axis text's font style (color, font size, face)
a<- a+ theme(axis.text.x = element_text(color = "black",size = 15, face = "bold"))
a<- a+ theme(axis.text.y = element_text(color = "black",size = 15, face = "bold"))

########make heatmap plot (geom_tile) end########

########save ggplot - default
opath_png1 = paste0("C:/Users/coldbrew/Downloads/test-default", ".png")
ggsave(opath_png1)

########save ggplot and set image size - upgrade version
opath_png2 = paste0("C:/Users/coldbrew/Downloads/test-setsize", ".png")
ggsave(opath_png2, width =30, height = 20, units = "cm")
