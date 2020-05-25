#!/bin/bash
exec acpi -b | cut -c 12-

exit 0
