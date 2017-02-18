##                              PM2.5 PROJECT                         ##
##                             by Tanguy LEVENT                       ##        
########################################################################
plot4 <- function() {
        
        install.packages("RColorBrewer")
        install.packages("dplyr")
     
        library(RColorBrewer)
        library(dplyr)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        coal_combustion <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
        coal_combustion <- SCC[coal_combustion,]
        
        em <- NEI[NEI$SCC %in% coal_combustion$SCC,]
        em <- em %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
        
        barplot(em$Emissions/1000, names = em$year, ylim = c(0,600) ,ylab = "Emissions PM2.5 (ktons)", xlab = "years", main = "Emissions PM2.5 development from coal combustion in US", col = brewer.pal(n=4, name = 'Pastel1'))
        
        dev.copy(png, file = "plot4.png", width=480, height=480)
        dev.off()
        
}