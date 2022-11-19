import { reactShinyInput } from 'reactR';
import IconButton from '@mui/material/IconButton';
import SendIcon from '@mui/icons-material/Send';
import { createTheme, ThemeProvider } from '@mui/material/styles';


const IconInput = ({ configuration, value, setValue }) => {
    
  const theme = createTheme({
      status: {
        danger: configuration.mainColor,
      },
      palette: {
        primary: {
          main: configuration.mainColor,
          darker: configuration.mainColor,
        },
        neutral: {
          main: configuration.mainColor,
          contrastText: configuration.fontColor,
        },
      },
  });
    
  return( 
      <ThemeProvider theme={theme}>
          <IconButton 
            aria-label="sendicon"
            sx={{ color: configuration.mainColor }}
            onClick={() => setValue(value + 1)}
          >
            <SendIcon />
          </IconButton>
      </ThemeProvider>
  );
};


export default function initIconButton(){
  return reactShinyInput(
    '.icon_button',
    'shiny.muiinput.icon_button',
    IconInput
  );
}