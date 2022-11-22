library(shiny)
library(shiny.muiinput)

sources_vector <- dir(path = '../shiny-rock/examples/data/')

ui <- div(
  # titlePanel("reactR Input Example"),
  button_file_inputInput(inputId = 'inputFile',
                         label = 'Upload files', 
                         filetype_accept = '.zip, .txt, .rock, text/yaml',
                         outputDirPath = '010---raw-sources'
                         ),
  action_buttonInput(inputId = 'actionBTN', label = 'Submit'),
  textareaInput('textArea', 'Enter plain text', 10),
  input_fieldInput('textInput', 'Text field'),
  icon_buttonInput('iconbtn'),
  icon_buttonInput('iconbtn2'),
  textOutput("textOutput"),
  select_fieldInput('select_field', label = 'Directory', value = sources_vector),
  source_uploadInput('codeId', label = 'Code', startIcon=TRUE),
  source_uploadInput('sectionId', label = 'Section', endIcon=TRUE)
)


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

  # output$textOutput <- renderText({
  #    file <- input$inputFile
  #   print("Test")
  #   print("You entered: %s", input$inputFile)
  #   print(input)
  #   print(input$inputFile)
  #   print(file[1])
  #   print(file[2])
  #   saveData(file[1],file[2])
  # })

  observeEvent(input$textArea, {
    print(input$textArea)
  })
  observeEvent(input$textInput, {
    print(input$textInput)
  }, ignoreNULL = FALSE)
  
  observeEvent(input$actionBTN, {
    session
    files <- jsonlite::fromJSON(input$inputFile)

    files <- dplyr::filter(files,content != "")

    processDataSaving(
      filesList = files,
      outputDir = '010---raw-sources'
    )
    
    # # map files list
    # purrr::map(1:length(files), function(x) {
    #         shiny.muiinput::saveData(
    #            fileName  = files[[x]][[1]],
    #            data      = files[[x]][[2]],
    #            outputDir = 'data/010---raw-sources'
    #          )
    # })
    
    # index <- 1
    # using while loop
    # while (index <= length(files))
    #   # print('While loop here')
    # {
    #     if(index %% 2 == 0) {
    #        shiny.muiinput::saveData(
    #          fileName  = files[[index]][[1]],
    #          data      = files[[index]][[2]], 
    #          outputDir = shiny.muiinput::RAW_DATA_PATH
    #        )
    #     }
    #     # statements
    #     index = index + 1
    # }
#     dataChanged <- paste(data,"cool")
#     saveData(data)
#     print(loadData())
  })
  
  observeEvent(input$select_field, {
    print(input$select_field)
  })
  
  
  observeEvent(input$iconbtn, {
    updateSelect_fieldInput(session = getDefaultReactiveDomain(), 
                            inputId = 'select_field', 
                            # value = c('one', 'two', 'tjree'),
                            configuration = list(
                              label = 'Test',
                              value = NULL,
                              secondaryColor = '#ffffff',
                              mainColor = '#e05151'
                            )
                            )
  })
  
  observeEvent(input$iconbtn2, {
    updateSelect_fieldInput(session = getDefaultReactiveDomain(), 
                            inputId = 'select_field', 
                            # value = c('one', 'two', 'tjree'),
                            configuration = list(
                              label = 'Test2',
                              value = sources_vector,
                              secondaryColor = '#ffffff',
                              mainColor = '#e05151'
                            )
    )
  })

#   observe({
#     print(input$textArea)
#     print("Hello")
#   })
}

shinyApp(ui, server)
