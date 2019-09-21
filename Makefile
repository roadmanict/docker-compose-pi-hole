install:
	sudo systemctl stop pi-hole || echo "Can fail"
	sudo systemctl disable pi-hole || echo "Can fail"
	sudo rm -f /etc/systemd/system/pi-hole.service
	rm -f pi-hole.service
	cp pi-hole.service.template pi-hole.service
	sed -i -e "s/{USER}/${USER}/g" -e "s={WORKING_DIR}=${PWD}=g" pi-hole.service
	sudo systemctl daemon-reload
	sudo systemctl reset-failed
	sudo ln -s ${PWD}/pi-hole.service /etc/systemd/system/pi-hole.service
	sudo systemctl enable pi-hole
