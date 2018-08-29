systemd_unit_dir = /lib/systemd/system
sysconfdir = /etc/direwolf
tmpfilesdir = /etc/tmpfiles.d

SERVICES = \
	   direwolf@.service \
	   kisstnc@.service

TMPFILES = \
	   direwolf.conf

all:

install: install-config install-services install-tmpfiles

install-tmpfiles: $(TMPFILES)
	install -m 644 $(TMPFILES) $(tmpfilesdir)

install-config:
	install -m 755 -d $(DESTDIR)$(sysconfdir)

install-services: $(SERVICES)
	install -m 755 -d $(DESTDIR)$(systemd_unit_dir)
	for svc in $(SERVICES); do \
		install -m 644 $$svc $(DESTDIR)$(systemd_unit_dir); \
	done; \
	systemctl daemon-reload
