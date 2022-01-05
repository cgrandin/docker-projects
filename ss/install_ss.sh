#!/bin/bash

# Clone SS source and compile with optimization for ss docker image

install_dir=/usr/bin
ss_dir=$install_dir/ss

cd $install_dir
git clone --branch output_to_separate_files https://github.com/nmfs-stock-synthesis/stock-synthesis ss
cd $ss_dir
# Checking out 2021's base model commit
#git checkout c6c9178 # Commit where tag was changed to 3.30.16.03 (Oct 19, 2020)
#git checkout f65ff56 # Dec 15, 2020 (36 commits after change to 3.30.16.03) use this for 2021 assessment
#git checkout 33108e9 # Dec 18, 2020
#git checkout 02b927a # Dec 23, 2020
cat \
SS_versioninfo_330opt.tpl \
SS_readstarter.tpl \
SS_readdata_330.tpl \
SS_readcontrol_330.tpl \
SS_param.tpl \
SS_prelim.tpl \
SS_global.tpl \
SS_proced.tpl \
SS_biofxn.tpl \
SS_miscfxn.tpl \
SS_selex.tpl \
SS_popdyn.tpl \
SS_recruit.tpl \
SS_benchfore.tpl \
SS_expval.tpl \
SS_objfunc.tpl \
SS_write.tpl \
SS_write_ssnew.tpl \
SS_write_report.tpl \
SS_ALK.tpl \
SS_timevaryparm.tpl \
SS_tagrecap.tpl > ss.tpl

admb -f ss

