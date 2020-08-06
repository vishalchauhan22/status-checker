#!/bin/bash
cat $1 | parallel -j50 -q curl --connect-timeout 2 -w 'Status:%{http_code}| Size:%{size_download}| %{url_effective}| Location:%{redirect_url} \n' -o cli -sk | tee >(column -t -s "|") 
