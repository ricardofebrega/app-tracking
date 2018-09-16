[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.1-blue.svg)](https://doi.org/10.25663/bl.app.1)

# app-tracking
This service runs mrtrix tracking using SD_PROB, SD_STREAM, and DT_STREAM algorithms. It generates 3 separate track output for each algorithms.

### Authors
- Brent McPherson (bcmcpher@iu.edu)
- Lindsey Kitchell (kitchell@iu.edu)
- Soichi Hayashi (hayashis@iu.edu)

### Project director
- Franco Pestilli (franpest@indiana.edu)

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)

## Running the App 

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/bl.app.47](https://doi.org/10.25663/bl.app.47) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
    "dtiinit":  "/path/to/dtiinit/.",
    "freesurfer": "/path/to/freesurfer/output",
    "fibers": 500000,
    "fibers_max": 1000000
}
```

3. Launch the App by executing `main`

```bash
./main
```

### Sample Datasets

If you don't have your own input file, you can download sample datasets from Brainlife.io, or you can use [Brainlife CLI](https://github.com/brain-life/cli).

```
npm install -g brainlife
bl login
mkdir input
bl dataset download <ADD> && mv <ADD> input/track
bl dataset download <ADD> && mv <ADD> input/dtiinit
```

## Output

All output files will be generated under the current working directory (pwd). The main output of this App is a file called `output.mat`. This file contains following object.

```
ADD
```

`output.XXX` contains XXX.

#### Product.json

The secondary output of this app is `product.json`. This file allows web interfaces, DB and API calls on the results of the processing. 

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies.  

  - Matlab: https://www.mathworks.com/products/matlab.html
  - jsonlab: https://www.mathworks.com/matlabcentral/fileexchange/33381-jsonlab-a-toolbox-to-encode-decode-json-files
  - VISTASOFT: https://github.com/vistalab/vistasoft/
  - MRTRIX 2.0: https://jdtournier.github.io/mrtrix-0.2/index.html
