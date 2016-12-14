#' Select a Dataset
#' @name selectDataset
#' @import shiny miniUI
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
      names <- pkgs[input$tbl_rows_selected, 2]
      packages <- pkgs[input$tbl_rows_selected, 1]
      stopApp( data(list=names, package=packages )  )
    })

  }

  # run app
  runGadget(ui, server, viewer = dialogViewer("Dataset Select"))

}
