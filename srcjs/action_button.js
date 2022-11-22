import { reactShinyInput } from 'reactR';
import Button from '@mui/material/Button';
import { createTheme, ThemeProvider } from '@mui/material/styles';

const ActionButton = ({ configuration, value, setValue }) => {
    
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
      <Button
        variant={configuration.variant}
        size={configuration.size}
        disabled={configuration.disabled}
        onClick={() => setValue(value + 1)}
        sx = {{
              ":disabled": {
                backgroundColor: '#ffffff1f',
                color: '#f5f5f542'
              }
        }}
      >
        {configuration.label}
      </Button>
    </ThemeProvider>
  );
};


export default function initActionButton(){
  return reactShinyInput(
    '.action_button',
    'shiny.muiinput.action_button',
    ActionButton
  );
}
