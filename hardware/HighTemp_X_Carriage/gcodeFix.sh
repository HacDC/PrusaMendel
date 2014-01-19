#!/bin/bash
echo G21 > ./fixedGcode.tap
echo M3 >> ./fixedGcode.tap
cat "$1" >> ./fixedGcode.tap

sed -i 's/^G43.*H.*D.*//g' ./fixedGcode.tap

sed -i 's/G91 G28 Z0//g' ./fixedGcode.tap