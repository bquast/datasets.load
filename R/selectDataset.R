#' Select a Dataset
#' @name selectDataset
#' @import shiny miniUI
#' @export

selectDataset <- function() {

  # ui
  ui <- miniPage(
    gadgetTitleBar('Select Dataset'),
    miniContentPanel(
      dataTableOutput('tbl')
    )
  )

  # server
  server <- function(input, output, session) {

    pkgs <- datasets()

    output$tbl = renderDataTable(
      pkgs, options = list(lengthChange = FALSE)
    )

    observeEvent(input$done, {
      stopApp( data() )
    })

  }

  # run app
  runGadget(ui, server, viewer = dialogViewer("Dataset Selector"))

}
