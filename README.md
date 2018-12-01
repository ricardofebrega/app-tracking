[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.105-blue.svg)](https://doi.org/10.25663/bl.app.105)

# app-tracking

This service runs mrtrix tracking using SD_PROB, SD_STREAM, and DT_STREAM algorithms. It generates 3 separate whole brain tracking output for each algorithms.

### Authors
- Brent McPherson (bcmcpher@iu.edu)
- Lindsey Kitchell (kitchell@iu.edu)
- Soichi Hayashi (hayashis@iu.edu)
- Franco Pestilli (frakkopesto@gmail.com)
- Paolo Avesani (avesani@fbk.eu)

### Project director
- Franco Pestilli (franpest@indiana.edu)

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)

## Running the App 

### On Brainlife.io

You can submit this App online at ..

* For dtiinit input [https://doi.org/10.25663/bl.app.59](https://doi.org/10.25663/bl.app.59)
* For dwi input [https://doi.org/10.25663/bl.app.105](https://doi.org/10.25663/bl.app.105) 

via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
    "dwi":  "/path/to/dwi/dwi.nii.gz",
    "bvals":  "/path/to/dwi/dwi.bvals",
    "bvecs":  "/path/to/dwi/dwi.bvecs",
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
bl dataset download 5a050a00eec2b300611abff3 && mv 5a050a00eec2b300611abff3 input/dwi
bl dataset download 5a065cc75ab38300be518f51 && mv 5a065cc75ab38300be518f51 input/freesurfer
```

## Output

The output for App is composed by two [brainlife.io/DataTypes](brainlife.io/docs/user/datatypes) and four datasets. 

```
brainlife.io DataTypes: 
    - recon
    - track/tck
    
datasets:
    - recon
    - track/tck:dt_stream
    - track/tck:sd_stream
    - track/tck:sd_prob
```

#### Product.json

The secondary output of this app is `product.json`. This file allows web interfaces, DB and API calls on the results of the processing. 

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies.  

  - Matlab: https://www.mathworks.com/products/matlab.html
  - jsonlab: https://www.mathworks.com/matlabcentral/fileexchange/33381-jsonlab-a-toolbox-to-encode-decode-json-files
  - VISTASOFT: https://github.com/vistalab/vistasoft/
  - MRTRIX 2.0: https://jdtournier.github.io/mrtrix-0.2/index.html
