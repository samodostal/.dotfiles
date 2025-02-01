#!/bin/sh

governor=$(cpufreqctl.auto-cpufreq -g | tr ' ' '\n' | head -n 1)

output="N/A"
case $governor in
    "performance")
        output=""
        ;;
    "balance_power")
        output=""
        ;;
        
    "powersave")
        output=""
        ;;
    *)
        :
        ;;
esac

echo "${output}"
