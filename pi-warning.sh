#!/bin/bash
echo "Measure core voltage and disable warning"
vcgencmd measure_volts core
echo "avoid_warnings=1" >> /boot/config.txt
echo "Done!"
