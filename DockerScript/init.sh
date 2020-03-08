#!/bin/bash
set -ex

bash /etc/init.d/bt start
bash /etc/init.d/bt default

/bin/bash