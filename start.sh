#!/bin/bash
# sed -i 's/\r$//' start.sh

docker run -d -p 2222:22 --rm --name ssh-python hlabs/ssh-python