#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
action_buttonInput <- function(
    inputId,
    label,
    variant = c('contained', 'outlined', 'text'),
    size = c("medium", "small", "large"),
    disabled = FALSE,
    fontColor = '#ffffff',
    mainColor = '#e05151'
  ) {

  variant <- match.arg(variant)
  size <- match.arg(size)

  reactR::createReactShinyInput(
    inputId,
    "action_button",
    htmltools::htmlDependency(
      name = "action_button-input",
      version = "1.0.0",
      src = "www/shiny.muiinput/main_bundle",
      package = "shiny.muiinput",
      script = "bundle.js"
    ),
    default = NULL,
    configuration = list(
      label = label,
      variant = variant,
      disabled = disabled,
      size = size,
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
updateAction_buttonInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
