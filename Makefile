systemd_unit_dir = /lib/systemd/system
sysconfdir = /etc/direwolf

SERVICES = \
	   direwolf@.service \
	   kisstnc@.service

all:

install: install-config install-services

install-config:
	install -m 755 -d $(DESTDIR)$(sysconfdir)

install-services: $(SERVICES)
	install -m 755 -d $(DESTDIR)$(systemd_unit_dir)
	for svc in $(SERVICES); do \
		install -m 644 $$svc $(DESTDIR)$(systemd_unit_dir); \
	done; \
	systemctl daemon-reload
