#' <File Input Button>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#'
#' @export
RAW_DATA_PATH <- NULL
# Create raw files output directory
#' @export
check_create__outputDir <- function(path, temp_dir) {
  
  # call parent env to rewrite `RAW_DATA_PATH` variable
  env <- parent.frame()
  
  
  if(is.null(path)) message('`path` argument can not be empty')
  
  path <- stringr::str_remove_all(path, pattern = '/')
  # If folder `data` doesn't exist
  if(!dir.exists(paste0(temp_dir, '/data'))) {
    dir.create('data')
    dir.create(as.character(stringr::str_glue('{temp_dir}/data/{path}')))
    env$RAW_DATA_PATH <- as.character(stringr::str_glue('{temp_dir}/data/{path}'))
  }
  
  # If folder `data` exists
  if(dir.exists(paste0(temp_dir,'/data'))) {
    if(!dir.exists(as.character(stringr::str_glue('{temp_dir}/data/{path}')))) {
      dir.create(as.character(stringr::str_glue('{temp_dir}/data/{path}')))
      env$RAW_DATA_PATH <- as.character(stringr::str_glue('{temp_dir}/data/{path}'))
    }
  }
  
}


#' @export
button_file_inputInput <- function(
    inputId,
    label,
    filetype_accept,
    outputDirPath,
    temp_dir,
    fontColor = '#ffffff',
    mainColor = '#e05151'
  ) {
  # Call function to create output directory
  shiny.muiinput::check_create__outputDir(outputDirPath, temp_dir)
  
  reactR::createReactShinyInput(
    inputId,
    "button_file_input",
    htmltools::htmlDependency(
      name = "button_file_input-input",
      version = "1.0.0",
      src = "www/shiny.muiinput/main_bundle",
      package = "shiny.muiinput",
      script = "bundle.js"
    ),
    default = NULL,
    configuration = list(
      label           = label,
      filetype_accept = filetype_accept,
      fontColor       = fontColor,
      mainColor       = mainColor
    ),
    htmltools::tags$div
  )
}


#' @export
saveData <- function(fileName, data, outputDir, file_extension = '.txt') {
    # Create a unique file name 
    fileName <- sprintf(fileName, as.integer(Sys.time()), digest::digest(data))
#     add txt extension
#     fileName <- paste0(fileName, file_extension)
    # Write files to the output directory
    writeLines(
      data, 
      file.path(outputDir, fileName)
    )
}

#' @export
processDataSaving <- function(filesList, outputDir, temp_dir) {
  # map files list
  if(dir.exists(paste0(temp_dir, '/data'))) {
    purrr::map(1:nrow(filesList), function(x) {
        shiny.muiinput::saveData(
            fileName  = filesList$fileName[x],
            data      = filesList$content[x],
            outputDir = paste0(temp_dir, '/data/', outputDir)
        )
    })
  } else {
    message('`data` directory doesnt exist!')
    
    dir.create(paste0(temp_dir, '/data'))
    dir.create(paste0(temp_dir, '/data/', outputDir))
    
    purrr::map(1:nrow(filesList), function(x) {
      shiny.muiinput::saveData(
        fileName  = filesList$fileName[x],
        data      = filesList$content[x],
        outputDir = paste0(temp_dir, '/data/', outputDir)
      )
    })
    
  }

}



#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateButton_file_inputInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
