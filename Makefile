install:
	sudo systemctl stop pi-hole || echo "Can fail"
	sudo systemctl disable pi-hole || echo "Can fail"
	sudo rm -rf /etc/systemd/system/pi-hole.service
	sudo systemctl daemon-reload
	sudo systemctl reset-failed
	sudo ln -s ${PWD}/pi-hole.service /etc/systemd/system/pi-hole.service
	sudo systemctl enable pi-hole
