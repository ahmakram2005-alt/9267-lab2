# Lab 2 – Simple Antivirus

A simple Bash project that scans files, moves suspicious files to quarantine, and allows the user to restore them.

## Project Files
- `antivirusd.sh`: scans the target folder and moves suspicious files to quarantine.
- `restore.sh`: lists quarantined files and restores the selected file.
- `Makefile`: provides commands to run both scripts.
- `test-files/`: contains files used for testing.
- `quarantine/`: stores suspicious files moved during scanning.

## How to Run
Run these commands from the project folder.

### Scan files
```bash
make antivirus
```
Scans the test files and quarantines suspicious ones.

### Restore a file
```bash
make restore
```
Displays the quarantined files. Enter a file number to restore it.

To stop a running script, press `Ctrl + C`.

## Requirements
Linux, Bash, and make.