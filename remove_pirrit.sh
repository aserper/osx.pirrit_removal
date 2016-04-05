echo "*** Osx.Pirit Removal script, Amit server, @0xamit ***"

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
