sidebarMenu(
 
  menuItem(
    "Ingest Workflow",
    tabName = "ingestWorkflow",
    icon = icon("database", lib = "font-awesome")
  ),
  menuItem(
    "About",
    tabName = "About",
    icon = icon("info-circle", lib = "font-awesome")
  ),
  shinyjs::hidden(
    div(id = "select_in",
      actionBttn("d1Input", label = "Import from DataONE",
                 icon = icon("download", lib = "font-awesome"),
                 size = "xs", color = "success"),
      actionBttn("lclUpload", label = "Upload Local Files",
                 icon = icon("upload", lib = "font-awesome"),
                 size = "xs", color = "success")
    )
  )
)
