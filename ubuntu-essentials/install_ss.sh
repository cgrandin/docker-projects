#!/bin/bash

# Clone SS source and compile with optimization for ss docker image

install_dir=/usr/bin
ss_dir=$install_dir/ss3

cd $install_dir
git clone --branch v3.30.22 https://github.com/nmfs-stock-synthesis/stock-synthesis $ss_dir
cd $ss_dir
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
