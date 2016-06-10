fluidPage(
    h2("Prototype"),
    leafletOutput("mymap"),
    p(),
    
    # info panel on hover event
    absolutePanel(
        right = 30, top = 10, width = 200, class = "floater",
        h4("Info"),
        uiOutput("stateInfo")
    )
)