SHELL := /bin/bash

.PHONY: backup install install-package manage restore restore-package status

backup:
	bash ./bin/backup

manage:
	bash ./bin/manage

install:
	bash ./bin/install

install-package:
	bash ./bin/install --package "$(PACKAGE)"

restore:
	bash ./bin/restore $(if $(APPLY),--apply,)

restore-package:
	bash ./bin/restore --package "$(PACKAGE)" $(if $(APPLY),--apply,)

status:
	bash ./bin/status
