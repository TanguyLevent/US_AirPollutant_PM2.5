##                              PM2.5 PROJECT                         ##
##                             by Tanguy LEVENT                       ##        
########################################################################
plot3 <- function() {
        
        install.packages("RColorBrewer")
        install.packages("dplyr")
        install.packages("ggplot2")
       
        library(RColorBrewer)
        library(dplyr)
        library(ggplot2)
        
        NEI <- readRDS("summarySCC_PM25.rds")
        em <- NEI %>% filter(fips == "24510") %>% group_by(type,year) %>% summarise(Emissions = sum(Emissions))
        
        ggplot(em, aes(factor(year), Emissions, fill=type)) + 
                geom_bar(stat="identity") + 
                facet_grid(. ~ type) + 
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
                ggtitle("Emissions PM2.5 development in Baltimore City, Maryland (US) split by type of sources")
        
        dev.copy(png, file = "plot3.png", width=480, height=480)
        dev.off()
        
}