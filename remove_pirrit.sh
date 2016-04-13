echo "*** Osx.Pirit Removal script, Amit Serper, @0xamit ***"
echo "*** BEFORE YOU RUN THIS SCRIPT, STOP! I CAN'T TAKE ANY RESPONSIBILITY ON ANY DAMAGES HAPPENING TO YOUR MACHINE. YOU ARE THE MASTER OF YOUR OWN FATE"
echo "*** Before running this script check that you are indeed infected with osx.pirrit. TERMINATE THIS SCRIPT BY HITTING CTRL+C AND RUNNING THE FOLLOWING COMMAND:"
echo "$ dscl . -list /Users UniqueID | grep 401"
echo "If this command has an output then continue running this script. Else DONT"
echo "Press any key to continue running this script, remember - I am not responsible for any unfortunate outcomes"
read

echo "[*] Getting net_pref name"
netPrefFileName=$(sudo defaults read /Library/Preferences/com.common.plist net_pref)

echo "[*] Netperf name is:"
echo $netPrefFileName

echo "[*] Getting appname from com.common.plist"
appName=$(sudo defaults read /Library/Preferences/com.common.plist name)
echo $appName

echo "[*] Stopping and removing LaunchDaemon"
sudo launchctl unload -w "/Library/LaunchDaemons/"$netPrefFileName
sudo killall $appName

sudo rm "/Library/LaunchDaemons/"$netPrefFileName

echo "[*] Removing injector"
sudo rm -r "/Library/"$appName
echo "[*] Removing malicious pf configs made by Pirrit"
sudo rm /etc/change_net_settings.sh

sudo pfctl -evf /etc/pf.conf

servicePrefFileName=$(sudo defaults read /Library/Preferences/com.common.plist service_pref)
echo “[*] Net pref file name:”
echo $netPrefFileName

appName=$(sudo defaults read /Library/Preferences/com.common.plist name)
echo “[*] App name is:”
echo $appName

echo “[*] Removing LaunchDaemon”
sudo launchctl unload -w "/Library/LaunchDaemons/"$servicePrefFileName
echo [*] Killing app and osascript”
sudo killall $appName
sudo killall osascript

echo “[*] Cleaning up…”
sudo rm "/Library/LaunchDaemons/"$servicePrefFileName

sudo rm -r "/Library/"$appName

echo “[*] Removing pirrit launching script”
sudo rm /etc/run_app.sh

echo “Script finished\n”
