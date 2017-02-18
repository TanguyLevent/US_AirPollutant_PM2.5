##                              PM2.5 PROJECT                         ##
##                             by Tanguy LEVENT                       ##        
########################################################################
plot2 <- function() {
        
        install.packages("RColorBrewer")
        install.packages("dplyr")
        
        library(RColorBrewer)
        library(dplyr)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        em <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
        barplot(em$Emissions, names = em$year, ylim = c(0,4000), ylab = "Emissions PM2.5 (tons)", xlab = "years", main = "Emissions PM2.5 development in Baltimore City, Maryland (US)", col = brewer.pal(n=4, name = 'Pastel1'))
        
        dev.copy(png, file = "plot2.png", width=480, height=480)
        dev.off()
        
}