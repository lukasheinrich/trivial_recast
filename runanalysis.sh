#!/bin//sh

resultfile=$1

function random(){
   local value=$(awk -v random=$RANDOM 'BEGIN{srand(random); print rand()}')
   echo $value
}
m2e=$(random)
m1e=$(random)
exp=$(random)
p1e=$(random)
p2e=$(random)
obs=$(random)
logl=$(random)
cat << EOF > $resultfile
{
 "lower_2sig_expected_CLs":$m2e,
 "lower_1sig_expected_CLs":$m1e,
 "expected_CLs":$exp,
 "upper_1sig_expected_CLs":$p1e,
 "upper_2sig_expected_CLs":$p2e,
 "observed_CLs":$obs,
 "log_likelihood_at_reference":$logl
}
EOF
cat $resultfile
