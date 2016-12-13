#' Select a Dataset
#' @name selectDataset
#' @import shiny miniUI DT
#' @export

selectDataset <- function() {

  # ui
  ui <- miniPage(
    gadgetTitleBar('Dataset Select'),
    miniContentPanel(
      DT::dataTableOutput('tbl')
    )
  )

  # server
  server <- function(input, output, session) {

    pkgs <- datasets()

    output$tbl = DT::renderDataTable(
      pkgs, options = list(lengthChange = FALSE, paging=FALSE)
    )

    observeEvent(input$done, {
      stopApp( data() )
    })

  }

  # run app
  runGadget(ui, server, viewer = dialogViewer("Dataset Select"))

}
