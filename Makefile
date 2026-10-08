antivirus: setup
	bash antivirusd.sh test-files quarantine 5

restore: setup
	bash restore.sh test-files quarantine

setup:
	mkdir -p quarantine