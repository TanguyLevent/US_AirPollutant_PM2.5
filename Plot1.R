##                              PM2.5 PROJECT                         ##
##                             by Tanguy LEVENT                       ##        
########################################################################
plot1 <- function() {
        
        install.packages("RColorBrewer")
        install.packages("dplyr")
        
        library(RColorBrewer)
        library(dplyr)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        em <- NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
        barplot(em$Emissions/1000, names = em$year, ylim = c(0,8000) ,ylab = "Emissions PM2.5 (ktons)", xlab = "years", main = "Emissions PM2.5 development in US", col = brewer.pal(n=4, name = 'Pastel1'))
        
        dev.copy(png, file = "plot1.png", width=480, height=480)
        dev.off()

}