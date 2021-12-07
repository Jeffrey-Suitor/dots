#!/bin/sh
exec ~/programs/matlab/bin/matlab -r "s = settings;s.matlab.desktop.DisplayScaleFactor.PersonalValue=$1;quit"
