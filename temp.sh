#!/bin/bash
exec acpi -t | cut -c 16-20

exit 0
