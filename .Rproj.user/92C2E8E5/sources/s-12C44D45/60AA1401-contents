import { reactShinyInput } from 'reactR';
import Button from '@mui/material/Button';

const ActionButton = ({ configuration, value, setValue }) => {

  return(
    <Button
      variant={configuration.variant}
      size={configuration.size}
      disabled={configuration.disabled}
      onClick={() => setValue(value + 1)}
    >
      {configuration.label}
    </Button>

  );
};


export default function initActionButton(){
  return reactShinyInput(
    '.action_button',
    'shiny.muiinput.action_button',
    ActionButton
  );
}
