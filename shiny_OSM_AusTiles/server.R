shinyServer(function(input, output, session){
    
    output$mymap <- renderLeaflet({
        
        # plot
        leaflet(gdal.states) %>% setView(lng = 133.583, lat = -25.833, zoom = 4) %>%
            addTiles() %>%
            addPolygons(
                weight      = 2,
                opacity     = 1,
                color       = 'white',
                dashArray   = '3',
                fillOpacity = 0.7,
                fillColor   = ~pal(density),
                popup       = ~sprintf("<strong>%s</strong><br/>%g someQty", STATE_NAME, density)
            )
        
    })
    
})