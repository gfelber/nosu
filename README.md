# NOSU
low profile wrapper (<512B) to escalate privileges (need SUID bit)

usage:
```bash
./nosu BINARY [ARGS...]
```

Note current environment is included.

## Requirements
+ gcc
+ make

## build
```bash
make      # amd64
```

## Exit Codes:
1. execve failed
2. no BINARY specified 
3. setuid failed (no SUID bit?)
