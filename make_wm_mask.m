function out = make_wm_mask()

if ~isdeployed
    disp('loading paths (HPC)')
    addpath(genpath('/N/u/brlife/git/vistasoft'))
    addpath(genpath('/N/u/brlife/git/jsonlab'))
end
    
% load my own config.json
config = loadjson('config.json');
%
% out = make_wm_mask( config )
%
% Copyright 2016 Franco Pestilli Indiana University 

% Below are the numeric codes for all the brain regions in the FreeSurfer
% output that we will use as our definition of White Matter
invals  = [2 41 16 17 28 60 51 53 12 52 13 18 ...
           54 50 11 251 252 253 254 255 10 49 46 7];

% We save always int he current directory by SCA mandate.
wmMaskFile = 'wm.nii.gz';

% Find the FreeSurfer files
fs_wm = fullfile(config.freesurfer,'mri','aseg.mgz');

disp('working directory is');
pwd
eval(sprintf('!mri_convert  --out_orientation RAS %s %s', fs_wm, wmMaskFile));
wm       = niftiRead(wmMaskFile);
wm.fname = 'wm.nii.gz';
out      = wm.fname;

% Find the numeric codes for Regions of Interests
origvals = unique(wm.data(:));

wmCounter=0;
noWMCounter=0;
for ii = 1:length(origvals);
    if any(origvals(ii) == invals)
        wm.data( wm.data == origvals(ii) ) = 1;
        wmCounter=wmCounter+1;
    else
        wm.data( wm.data == origvals(ii) ) = 0;
        noWMCounter = noWMCounter + 1;
    end
end
niftiWrite(wm);
