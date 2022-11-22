import { reactShinyInput } from 'reactR';
import Box from '@mui/material/Box';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select, { SelectChangeEvent } from '@mui/material/Select';
import { createTheme, ThemeProvider } from '@mui/material/styles';


const SelectInputField = ({ configuration, value, setValue }) => {
    
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
          contrastText: configuration.secondaryColor,
        },
      },
  });
  
  const handleChange = (event) => {
    setValue(event.target.value);
  };

    
  return (
    <ThemeProvider theme={theme}>
        <Box>
          <FormControl fullWidth disabled={configuration.disabled}>
            <InputLabel sx={
                            configuration.disabled ? {'&.Mui-disabled': {color: '#f5f5f542'}} : { color: configuration.secondaryColor }
                        }
                        id="demo-simple-select-label">{configuration.label}</InputLabel>
            <Select
              labelId="demo-simple-select-label"
              id="demo-simple-select"
              value={value}
              label={configuration.label}
              onChange={handleChange}
              sx={[{'&.Mui-disabled': {
                      color: '#f5f5f542',
                      "&& fieldset": {
                            border: `1px solid #f5f5f542`,
                            color: '#f5f5f542' 
                      }
                    },
                    '&:hover': {
                    "&& fieldset": {
                        border: configuration.disabled ? `1px solid #f5f5f542` :`2px solid ${configuration.secondaryColor}`
                      },
                    }
                    },
                    { color: configuration.secondaryColor },
                    {
                        "&& fieldset": {
                            border: `1px solid ${configuration.secondaryColor}`,
                            color: configuration.secondaryColor
                        }
                    },
                    {
                      
                      
                    }
                 ]}
            >
              {!(configuration.value === null)
                ? configuration.value.map(item => <MenuItem value={item}>{item}</MenuItem>)
                : null
              }
            </Select>
          </FormControl>
        </Box>
    </ThemeProvider>
  );
  
};


export default function initSelect(){
  reactShinyInput(
    '.select_field',
    'shiny.muiinput.select_field',
    SelectInputField
  );
}
