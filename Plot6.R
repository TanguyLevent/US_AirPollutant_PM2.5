##                              PM2.5 PROJECT                         ##
##                             by Tanguy LEVENT                       ##        
########################################################################
plot6 <- function() {
        
        install.packages("RColorBrewer")
        install.packages("dplyr")
        install.packages("ggplot2")
        
        library(RColorBrewer)
        library(dplyr)
        library(ggplot2)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
       
        em1 <- NEI %>% filter(fips == "24510", type == "ON-ROAD") %>% group_by(year,fips) %>% summarise(Emissions = sum(Emissions))
        em1[,2] <- "Baltimore"
        em2 <- NEI %>% filter(fips == "06037", type == "ON-ROAD") %>% group_by(year, fips) %>% summarise(Emissions = sum(Emissions))
        em2[,2] <- "Los Angeles"
        em <- rbind(em1,em2)
        em <- em %>% arrange(year)
        
        ggplot(em, aes(factor(year), Emissions, fill=fips)) + 
                geom_bar(stat="identity") + 
                facet_grid(fips~., scales="free") + 
                scale_fill_brewer(palette="Pastel1") +
                theme_bw() + 
                theme( strip.background  = element_blank(),
                       panel.grid.major = element_line(colour = "grey80"),
                       panel.border = element_blank(),
                       axis.ticks = element_blank(),
                       panel.grid.minor.x=element_blank(),
                       panel.grid.major.x=element_blank() ) +
                theme(legend.position="bottom") + 
                xlab("years") +
                ylab ("Emissions PM2.5 (tons)") +
                ggtitle("Emissions PM2.5 comparaison between Baltimore City and Los Angeles")
        
        
        dev.copy(png, file = "plot6.png", width=480, height=480)
        dev.off()
        
}
