#If free percentage is less than equal to 15% of total RAM trigger the cleanup

if [ $_ram_avl -le 15 ]; then

echo "RAM available in system is below 15 percentage clearing cache and freeing up memory";
echo
free -h && sync && echo 3 > /proc/sys/vm/drop_caches && free -h
echo
sudo sysctl vm.drop_caches=1
echo 
sudo apt-get autoclean && sudo apt-get autoremove
echo
# APT generates a cache of install apps and keeps them in your /var/cache/apt/archives directory even after those apps have been uninstalled
sudo du -sh /var/cache/apt
echo
sudo apt-get clean
echo
fi;


