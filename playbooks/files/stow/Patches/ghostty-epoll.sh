#!/bin/bash
shopt -s globstar

sed -i 's/^const xev = @import("xev");$/const xev = @import("xev").Epoll;/' **/*.zig
grep -R 'const xev = @import("xev"' .
