# osx.pirrit_removal
Script to remove osx pirrit.


**Edit**: One variation of pirrit seems to create a lot of these processes/services which need to be removed using random dictionary words in place of com.<name>.plist
This snippet will grab the eligible app names based on the contents of the plist file (not 100% accurate)

Download this script, give it execute permissions (chmod +x) 

**BEFORE**:
Check the output of   
```grep 'channel\|click_id' /Library/Preferences/*.plist  | cut -d ':' -f 1 | sed 's/.*\///g' | uniq ```
and ensure that the list seems reasonable.

**DO NOT** run the follow if the list above is empty! 


This is the command to execute (**NOTE** the following command uses sudo, never execute commands copied from the internet):  
` grep 'channel\|click_id' /Library/Preferences/*.plist  | cut -d ':' -f 1 | sed 's/.*\///g' | uniq |  xargs -I {} sudo ./remove_pirrit.sh {}`

