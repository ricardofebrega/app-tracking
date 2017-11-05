function [] = main()

switch getenv('ENV')
case 'IUHPC'
        disp('loading paths (HPC)')
        addpath(genpath('/N/u/brlife/git/vistasoft'))
        addpath(genpath('/N/u/brlife/git/jsonlab'))
end
    
% load my own config.json
config = loadjson('config.json');
dt6config = loadjson(fullfile(config.dtiinit, '/dt6.json'));
    
%% Create an MRTRIX .b file from the bvals/bvecs of the shell chosen to run
mrtrix_bfileFromBvecs(fullfile(config.dtiinit,dt6config.files.alignedDwBvecs), fullfile(config.dtiinit,dt6config.files.alignedDwBvals), 'grad.b');

[ out ] = make_wm_mask(config);

