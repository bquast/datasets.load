#' Load Datasets from a Menu
#' @name datasets.load
#' @import shiny miniUI
#' @export

datasets.load <- function() {

  # ui
  ui <- miniPage(
    miniTitleBar('Select Datasets', right=miniTitleBarButton('done', 'Load', primary = TRUE)),
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
  runGadget(ui, server, viewer = dialogViewer("Datasets Load"))

}
