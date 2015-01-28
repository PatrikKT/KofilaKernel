#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/kofila.conf"

#L2M
L2M=`grep "item.0.1" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Logo2Menu Settings #####\n# 0 to disable logo2menu" >> $CONFIGFILE
echo -e "# 1 to enable logo2menu\n" >> $CONFIGFILE
if [ $L2M = 1 ]; then
echo "LOGO2MENU=1" >> $CONFIGFILE;
else
echo "LOGO2MENU=0" >> $CONFIGFILE;
fi

#Wake Gestures
GESTURES=`grep selected.0 /tmp/aroma/wg.prop | cut -d '=' -f2`
echo -e "\n\n##### Wake Gestures Settings #####\n# 0 to disable wake gestures" >> $CONFIGFILE
echo -e "# 1 to enable  wake gestures\n" >> $CONFIGFILE
if [ $GESTURES = 1 ]; then
  echo "WG=1" >> $CONFIGFILE;
else
  echo "WG=0" >> $CONFIGFILE;
fi


if [ $GESTURES = 1 ]; then


#Pocket detection
POCKET=`grep "item.0.1" /tmp/aroma/wgopt.prop | cut -d '=' -f2`
echo -e "\n\n##### Pocket Detection Settings #####\n# 0 to disable pocket detection" >> $CONFIGFILE
echo -e "# 1 to enable pocket detection(default)\n" >> $CONFIGFILE
if [ $POCKET = 1 ]; then
  echo "POCKET=1" >> $CONFIGFILE;
else
  echo "POCKET=0" >> $CONFIGFILE;
fi

#S2W
echo -e "\n\n##### Sweep2wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep left" >> $CONFIGFILE
echo -e "# 4 to enable sweep up" >> $CONFIGFILE
echo -e "# 8 to enable sweep down\n" >> $CONFIGFILE
echo -e "# For combinations, add values together (e.g. all gestures enabled = 15)\n" >> $CONFIGFILE
echo "S2W=15" >> $CONFIGFILE;

#DT2W
echo -e "\n\n##### DoubleTap2Wake Settings #####\n# 0 to disable DoubleTap2Wake" >> $CONFIGFILE
echo -e "# 1 to enable DoubleTap2Wake\n# 2 to enable DoubleTap2Wake fullscreen\n" >> $CONFIGFILE
echo "DT2WAKE=2" >> $CONFIGFILE;

#L2W
echo -e "\n\n##### Logo2Wake Settings #####\n# 0 to disable Logo2Wake" >> $CONFIGFILE
echo -e "# 1 to enable Logo2Wake\n" >> $CONFIGFILE
echo "LOGO2WAKE=1" >> $CONFIGFILE;


elif [ $GESTURES = 2 ]; then


#S2W
SR=`grep "item.0.1" /tmp/aroma/sw.prop | cut -d '=' -f2`
SL=`grep "item.0.2" /tmp/aroma/sw.prop | cut -d '=' -f2`
SU=`grep "item.0.3" /tmp/aroma/sw.prop | cut -d '=' -f2`
SD=`grep "item.0.4" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep left" >> $CONFIGFILE
echo -e "# 4 to enable sweep up" >> $CONFIGFILE
echo -e "# 8 to enable sweep down\n" >> $CONFIGFILE
echo -e "# For combinations, add values together (e.g. all gestures enabled = 15)\n" >> $CONFIGFILE
if [ $SL = 1 ]; then
  SL=2
fi
if [ $SU == 1 ]; then
  SU=4
fi
if [ $SD == 1 ]; then
  SD=8
fi  

S2W=$(( SL + SR + SU + SD ))
echo S2W=$S2W >> $CONFIGFILE;

#DT2W
DT2W=`grep "item.0.5" /tmp/aroma/sw.prop | cut -d '=' -f2`
DT2WF=`grep "item.0.6" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### DoubleTap2Wake Settings #####\n# 0 to disable DoubleTap2Wake" >> $CONFIGFILE
echo -e "# 1 to enable DoubleTap2Wake\n# 2 to enable DoubleTap2Wake fullscreen\n" >> $CONFIGFILE
if [ $DT2W = 1 ]; then
  echo "DT2W=1" >> $CONFIGFILE;
elif [ $DT2WF = 1 ]; then
  echo "DT2W=2" >> $CONFIGFILE;
else
  echo "DT2W=0" >> $CONFIGFILE;
fi

#L2W
L2W=`grep "item.0.7" /tmp/aroma/sw.prop | cut -d '=' -f2`
L2S=`grep selected.2 /tmp/aroma/s2s.prop | cut -d '=' -f2`
echo -e "\n\n##### Logo2Wake Settings #####\n# 0 to disable Logo2Wake/Logo2Sleep" >> $CONFIGFILE
echo -e "# 1 to enable Logo2Wake/Logo2Sleep\n" >> $CONFIGFILE
if [ $L2W = 1 ]; then
  echo "LOGO2WAKE=1" >> $CONFIGFILE;
elif [ $L2S = 1 ]; then
  echo "LOGO2WAKE=1" >> $CONFIGFILE;
else
  echo "LOGO2WAKE=0" >> $CONFIGFILE;
fi

#Pocket detection
POCKET=`grep "item.0.8" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Pocket Detection Settings #####\n# 0 to disable pocket detection" >> $CONFIGFILE
echo -e "# 1 to enable pocket detection(default)\n" >> $CONFIGFILE
if [ $POCKET = 1 ]; then
  echo "POCKET=1" >> $CONFIGFILE;
else
  echo "POCKET=0" >> $CONFIGFILE;
fi


else


#S2W
echo -e "\n\n##### Sweep2wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep left" >> $CONFIGFILE
echo -e "# 4 to enable sweep up" >> $CONFIGFILE
echo -e "# 8 to enable sweep down\n" >> $CONFIGFILE
echo -e "# For combinations, add values together (e.g. all gestures enabled = 15)\n" >> $CONFIGFILE
echo "S2W=0" >> $CONFIGFILE;

#DT2W
echo -e "\n\n##### DoubleTap2Wake Settings #####\n# 0 to disable DoubleTap2Wake" >> $CONFIGFILE
echo -e "# 1 to enable DoubleTap2Wake\n# 2 to enable DoubleTap2Wake fullscreen\n" >> $CONFIGFILE
echo "DT2W=0" >> $CONFIGFILE;

#L2W
L2S=`grep selected.2 /tmp/aroma/s2s.prop | cut -d '=' -f2`
echo -e "\n\n##### Logo2Wake Settings #####\n# 0 to disable Logo2Wake/Logo2Sleep" >> $CONFIGFILE
echo -e "# 1 to enable Logo2Wake/Logo2Sleep\n" >> $CONFIGFILE
if [ $L2S = 1 ]; then
  echo "LOGO2WAKE=1" >> $CONFIGFILE;
else
  echo "LOGO2WAKE=0" >> $CONFIGFILE;
fi

#Pocket detection
echo -e "\n\n##### Pocket Detection Settings #####\n# 0 to disable pocket detection" >> $CONFIGFILE
echo -e "# 1 to enable pocket detection(default)\n" >> $CONFIGFILE
echo "POCKET=0" >> $CONFIGFILE;


fi


#VIBRATION
VIB=`cat /tmp/aroma/vibrate.prop | cut -d '=' -f2`
echo -e "\n\n##### Vibration Settings #####\n# 0 to disable vibration" >> $CONFIGFILE
echo -e "# 1 for default vibration\n# 2 for stronger vibration\n" >> $CONFIGFILE
if [ $VIB = 1 ]; then
  echo "VIB=0" >> $CONFIGFILE;
elif [ $VIB = 3 ]; then
  echo "VIB=2" >> $CONFIGFILE;
else
  echo "VIB=1" >> $CONFIGFILE;
fi

#S2S
S2S=`grep selected.1 /tmp/aroma/s2s.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2sleep Settings #####\n# 0 to disable sweep2sleep" >> $CONFIGFILE
echo -e "# 1 to enable sweep2sleep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep2sleep left" >> $CONFIGFILE
echo -e "# 3 to enable sweep2sleep left and right\n" >> $CONFIGFILE
if [ $S2S = 2 ]; then
  echo "S2S=1" >> $CONFIGFILE;
elif [ $S2S = 3 ]; then
  echo "S2S=2" >> $CONFIGFILE;
elif [ $S2S = 4 ]; then
  echo "S2S=3" >> $CONFIGFILE;
else
  echo "S2S=0" >> $CONFIGFILE;
fi

#FASTCHARGE
FC=`grep "item.0.1" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Fastcharge Settings ######\n# 1 to enable usb fastcharge\n# 0 to disable usb fastcharge\n" >> $CONFIGFILE
if [ $FC = 1 ]; then
  echo "FC=1" >> $CONFIGFILE;
else
  echo "FC=0" >> $CONFIGFILE;
fi

#i/o scheduler
SCHED=`grep selected.0 /tmp/aroma/disk.prop | cut -d '=' -f2`
echo -e "\n\n##### i/o Scheduler #####\n# 1 CFQ (stock)" >> $CONFIGFILE
echo -e "# 2 ROW (default)\n# 3 deadline\n# 4 FIOPS\n# 5 SIO\n" >> $CONFIGFILE
if [ $SCHED = 1 ]; then
  echo "SCHED=1" >> $CONFIGFILE;
elif [ $SCHED = 2 ]; then
  echo "SCHED=2" >> $CONFIGFILE;
elif [ $SCHED = 3 ]; then
  echo "SCHED=3" >> $CONFIGFILE;
elif [ $SCHED = 4 ]; then
  echo "SCHED=4" >> $CONFIGFILE;
elif [ $SCHED = 5 ]; then
  echo "SCHED=5" >> $CONFIGFILE;
fi

echo -e "\n\n##############################" >> $CONFIGFILE
#END
