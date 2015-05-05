
load Decoder2.hdl,
output-file Decoder2.out,
compare-to Decoder2.cmp,
output-list s0%B3.1.3 s1%B3.1.3 out%B1.4.1;

set s0 0,
set s1 0,
eval,
output;

set s1 1,
eval,
output;

set s0 1,
eval,
output;


set s1 0,
eval,
output;

