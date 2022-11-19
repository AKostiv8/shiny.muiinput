#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
icon_buttonInput <- function(
  inputId, 
  fontColor = '#ffffff',
  mainColor = '#ffffff'
  ) {
  reactR::createReactShinyInput(
    inputId,
    "icon_button",
    htmltools::htmlDependency(
      name = "icon_button-input",
      version = "1.0.0",
      src = "www/shiny.muiinput/main_bundle",
      package = "shiny.muiinput",
      script = "bundle.js"
    ),
    default = NULL,
    list(
      fontColor = fontColor,
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
updateIcon_buttonInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}