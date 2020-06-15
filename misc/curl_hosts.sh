#!/bin/bash

for x in $(cat ~/repos/archerdx/configure/hosts | grep "^[0-9]"); do curl $x:3000; echo " ["$x"]"; done

