#!/bin/bash

profile=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

case "$profile" in
    performance)
        icon="🔥"
        class="performance"
        ;;
    powersave)
        icon="🪫"
        class="powersave"
        ;;
    balanced)
        icon="⚖️"
        class="balanced"
        ;;
    *)
        icon="❓"
        class="unknown"
        ;;
esac

echo "{\"text\": \"$icon $profile\", \"class\": \"$class\"}"

