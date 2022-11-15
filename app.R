library(shiny)
library(shiny.muiinput)

ui <- div(
  # titlePanel("reactR Input Example"),
  button_file_inputInput(inputId = 'inputFile', label = 'Upload files', filetype_accept = '.zip, .txt, .rock'),
  action_buttonInput(inputId = 'actionBTN', label = 'Submit'),
  textareaInput('textArea', 'Enter plain text', 10),
  textOutput("textOutput")
)

outputDir <- "data/010"

saveData <- function(fileName, data) {
  # Create a unique file name
  fileName <- sprintf(fileName, as.integer(Sys.time()), digest::digest(data))
  # Write the file to the local system
  write.table(
    x = data,
    file = file.path(outputDir, fileName),
#      sep = "\t",
#     row.names = FALSE
    )
}

loadData <- function() {
  # Read all the files into a list
  files <- list.files(outputDir, full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  # Concatenate all data together into one data.frame
  data <- do.call(rbind, data)
  data
}

# saveData <- function(data) {
#   data <- as.data.frame(t(data))
#   if (exists("responses")) {
#     responses <<- rbind(responses, data)
#   } else {
#     responses <<- data
#   }
# }
#
# loadData <- function() {
#   if (exists("responses")) {
#     responses
#   }
# }

server <- function(input, output, session) {

  output$textOutput <- renderText({
#      file <- input$inputFile
#     print("Test")
#     print("You entered: %s", input$inputFile)
#     print(input)
#     print(input$inputFile)
#     print(file[1])
#     print(file[2])
#     saveData(file[1],file[2])
  })

  observeEvent(input$actionBTN, {
    session
    files <- input$inputFile
    index <- 1
    # using while loop
    while (index <= length(files))
    {
        if(index %% 2 == 0){
            saveData(files[index-1],files[index])
        }
        # statements
        index = index + 1
    }
#     dataChanged <- paste(data,"cool")
#     saveData(data)
#     print(loadData())
  })
#
#   observe({
#     print(input$textArea)
#     print("Hello")
#   })
}

shinyApp(ui, server)
