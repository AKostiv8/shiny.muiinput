#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
textareaInput <- function(
    inputId,
    label,
    value = NULL,
    rowsInit,
    secondaryColor = '#ffffff',
    mainColor = '#e05151'
  ) {
  reactR::createReactShinyInput(
    inputId,
    "textarea",
    htmltools::htmlDependency(
      name = "textarea-input",
      version = "1.0.0",
      src = "www/shiny.muiinput/main_bundle",
      package = "shiny.muiinput",
      script = "bundle.js"
    ),
    default = value,
    configuration = list(
      label = label,
      rowsInit = rowsInit,
      secondaryColor = secondaryColor,
      mainColor = mainColor
    ),
    htmltools::tags$div
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateTextareaInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
