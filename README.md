# nopersonality
low profile wrapper (<256B) to disable ASLR with `ADDR_NO_RANDOMIZE`

usage:
```bash
./nopersonality BINARY [ARGS...]
```

Note current environment is included.

## Requirements
+ nasm
+ ld
+ make

## build
```bash
make      # amd64
# OR
make x86  # x86
```

## Exit Codes:
1. execve failed
2. no BINARY specified 
3. personality `ADDR_NO_RANDOMIZE` failed (docker disables by default)
