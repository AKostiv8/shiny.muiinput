import {reactShinyInput} from 'reactR';
import Button from '@mui/material/Button';
import {useState} from "react";
import JSZip from "jszip";

function UploadButton({configuration, value, setValue}) {
    let fileReader;

    const handleFileChosen = (file) => {
        console.log(value);
        if (file.type === "application/zip") {
            JSZip.loadAsync(file).then(function (zip) {
                Object.keys(zip.files).forEach(function (filename) {
                    // let content = zip.files[filename];
                    // console.log(file);
                    // console.log(content);

                    zip.files[filename].async('blob').then(function (blob) {
                        let reader = new FileReader();
                        reader.onload = function (event) {
                            saveValue(filename.split("/")[1],event.target.result);
                        }; // data url!
                        reader.readAsBinaryString(blob);
                    })
                });
            });
        } else {
            fileReader = new FileReader();
            // fileReader.onloadend = handleFileRead;
            fileReader.onloadend = function (event) {
                const content = event.target.result;
                saveValue(file.name,content)
            };
            fileReader.readAsText(file);
        }
    };

    function saveValue(fileName,content){
        let result = [];
        if(value && Array.isArray(value)){
            result = value;
        }
        result.push([fileName,content]);
        setValue(result);
        console.log(value);
    }


    return (
        <>
            {/*{isList ?*/}
            {/*    <>*/}
            {/*        {*/}
            {/*            listOfFiles.map((element) => {*/}
            {/*                console.log("here");*/}
            {/*                console.log(element);*/}
            {/*                return <p>{element}</p>*/}
            {/*            })*/}
            {/*        }*/}
            {/*    </>*/}
            {/*    : <></>*/}
            {/*}*/}
            <Button variant="contained" component="label">
                {configuration.label}
                {/*<input hidden accept={configuration.filetype_accept} multiple type="file"*/}
                {/*       onChange={fileSelectedHandler}/>*/}
                <input
                    id='file'
                    hidden
                    className='input-file'
                    accept={configuration.filetype_accept}
                    multiple
                    type="file"
                    onChange={e => {
                        let files = e.target.files;
                        for (let i = 0; i < files.length; i++) {
                            handleFileChosen(files[i]);
                        }
                    }}
                />
            </Button>
        </>
    )
}

export default function initUploadButton() {
    return reactShinyInput(
        '.button_file_input',
        'shiny.muiinput.button_file_input',
        UploadButton
    );
}
