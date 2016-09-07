echo "*** Osx.Pirit Removal script, Amit Serper, @0xamit ***"
echo "*** BEFORE YOU RUN THIS SCRIPT, STOP! I CAN'T TAKE ANY RESPONSIBILITY ON ANY DAMAGES HAPPENING TO YOUR MACHINE. YOU ARE THE MASTER OF YOUR OWN FATE"
echo "*** Before running this script check that you are indeed infected with osx.pirrit. TERMINATE THIS SCRIPT BY HITTING CTRL+C AND RUNNING THE FOLLOWING COMMAND:"
echo "$ dscl . -list /Users UniqueID | grep 401"
echo "If this command has an output then continue running this script. Else DONT"
echo "Press any key to continue running this script, remember - I am not responsible for any unfortunate outcomes"
read

if [ $# -eq 0 ]
  then
      echo "No arguments supplied, this was dangerous... but disaster has been avoided.  Read the README if you are unsure why this happened"
      exit
fi

echo "[*] Getting net_pref name"
netPrefFileName=$1

echo "[*] Netperf name is:"
echo $netPrefFileName

echo "[*] Getting appname from com.common.plist"
appName=$(echo $netPrefFileName  | sed 's/com\.//g' | sed 's/\.plist//g')
echo $appName

echo "[*] Stopping and removing LaunchDaemon"
sudo launchctl unload -w "/Library/LaunchDaemons/"$netPrefFileName
sudo killall $appName

sudo rm "/Library/LaunchDaemons/"$netPrefFileName
sudo rm "/Library/Preferences/"$netPrefFileName

echo "[*] Removing injector"
sudo rm -r "/Library/"$appName
echo "[*] Removing malicious pf configs made by Pirrit"
sudo rm /etc/change_net_settings.sh

sudo pfctl -evf /etc/pf.conf

echo “[*] Removing LaunchDaemon”
sudo launchctl unload -w "/Library/LaunchDaemons/"$netPrefFileName
echo [*] Killing app and osascript”
sudo killall $appName
sudo killall osascript

echo “[*] Cleaning up…”
sudo rm "/Library/LaunchDaemons/"$netPrefFileName

sudo rm -r "/Library/"$appName

echo “[*] Removing pirrit launching script”
sudo rm "/etc/"$appName".sh"
sudo rm "/etc/"$appName".conf"

echo “Script finished\n”
