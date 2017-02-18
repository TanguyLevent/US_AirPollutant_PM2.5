##                              PM2.5 PROJECT                         ##
##                             by Tanguy LEVENT                       ##        
########################################################################
plot5 <- function() {
        
        install.packages("RColorBrewer")
        install.packages("dplyr")
        
        library(RColorBrewer)
        library(dplyr)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        NEI <- readRDS("summarySCC_PM25.rds")
        em <- NEI %>% filter(fips == "24510", type == "ON-ROAD") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
        barplot(em$Emissions, names = em$year, ylim = c(0,400) ,ylab = "Emissions PM2.5 (ktons)", xlab = "years", main = "Emissions PM2.5 development from vehicles in Baltimore City", col = brewer.pal(n=4, name = 'Pastel1'))
        
        dev.copy(png, file = "plot5.png", width=480, height=480)
        dev.off()
        
}
