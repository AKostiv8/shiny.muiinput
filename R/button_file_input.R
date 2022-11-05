#' <File Input Button>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
button_file_inputInput <- function(
    inputId,
    label,
    filetype_accept
  ) {
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
      label = label,
      filetype_accept = filetype_accept
    ),
    htmltools::tags$div
  )
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
