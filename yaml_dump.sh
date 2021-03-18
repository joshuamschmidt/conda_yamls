#!/usr/local/bash

yaml_dir="~/Projects/conda_yamls"
# assume all envs can be activated by name: https://stackoverflow.com/questions/57527131/conda-environment-has-no-name-visible-in-conda-env-list-how-do-i-activate-it-a

for env in $(conda env list | cut -d" " -f1 | tail -n+4 | awk 'length($0) > 1'); 
do conda activate $env;
conda env export > ${yaml_dir}/${env}.yml;
conda deactivate;
done

