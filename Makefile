SHELL := /bin/bash

.PHONY: backup restore restore-package status

backup:
	bash ./bin/backup

restore:
	bash ./bin/restore $(if $(APPLY),--apply,)

restore-package:
	bash ./bin/restore --package "$(PACKAGE)" $(if $(APPLY),--apply,)

status:
	bash ./bin/status
