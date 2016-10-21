---
layout: lecture
title: "Shiny"
---

<p class="message">
  Getting started with Shiny
</p>

### Slides

You can find various tutorials about shiny from RStudio:

<a href="http://shiny.rstudio.com/tutorial/" target="_blank">http://shiny.rstudio.com/tutorial/</a>


### Tutorial

Garret Grolemund's __How to start with Shiny, Part 1__ materials
are available in this link: <a href="http://bit.ly/shiny-quickstart-1" target="_blank">bit.ly/shiny-quickstart-1</a>


### App template

The shortest viable shiny app (abstract example):

```
library(shiny)

ui <- fluidPage(
  # *Input() functions,
  # *Output() functions
)

server <- function(input, output) {
	output$obj <- renderPlot({
	  hist(x)
	})
}

shinyApp(ui = ui, server = server)
```


### Shiny Workflow

1. Begin each app with the template
2. Add elements as arguments to `fluidPage()`
3. Create reactive inputs with an `*Input()` function
4. Display reactive outputs with an `*Output()` function
5. Assemble outputs from inputs in the server function



Create an input with an `*Input()` function:

- `sliderInput()`
- `actionButton()`
- `checkboxInput()`
- `selectInput()`
- `textInput()`
- `numericInput()`
- `radioButtons()`
- `dateRangeInput()`
- etc

See __UI Inputs__ in the [shiny reference](http://shiny.rstudio.com/reference/shiny/latest/) 

[http://shiny.rstudio.com/gallery/widget-gallery.html](widget gallery)


Create an output with an `*Output()` function:

- `plotOutput()`
- `textOutput()`
- `dataTableOutput()`  interactive table
- `tableOutput()`  table
- `htmlOutput()`  
- etc

See __UI Outputs__ in the [shiny reference](http://shiny.rstudio.com/reference/shiny/latest/) 


Rendering Functions to be used in `server <- function(input, output) {}`:

- `renderPlot()`
- `renderText()`
- `renderPrint()`
- `renderDataTable()`
- `renderImage()`
- etc

See __Rendering functions__ in the [shiny reference](http://shiny.rstudio.com/reference/shiny/latest/) 
