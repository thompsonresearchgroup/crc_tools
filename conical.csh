#! /bin/csh

set file=$1
set LOG=$file.log
set SDIR=$file.summary

if (null$file == null) then
   echo " Please write name of log file"
   echo "  Usage: ./conical.summary.csh filename"
   echo "  Usage: filename.log ... name of log file" 
   exit 4
endif

if (-e $SDIR.tar) then
   echo "  Please remove $SDIR.tar in advance" 
   exit 4
else if(-e $SDIR) then
   echo "  Please remove $SDIR in advance"
   exit 4
endif

if (-e $LOG) then
mkdir $SDIR
grep    "RMS     Force        "       $LOG >! ./$SDIR/$file.rmsforce
grep    "Energy difference=    "      $LOG >! ./$SDIR/$file.Ediff
grep    " RMS     Displacement   "    $LOG >! ./$SDIR/$file.rmsdisplace
grep    "   ( 1)     EIGENVALUE    "  $LOG >! ./$SDIR/$file.eig1
grep    "   ( 2)     EIGENVALUE    "  $LOG >! ./$SDIR/$file.eig2
grep    "Projected Ivec Gradient:"    $LOG >! ./$SDIR/$file.projcted
tar -cvf $SDIR.tar $SDIR
else
   echo " file $LOG does not exist Sorry"   
   exit 4
endif

