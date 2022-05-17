
Input: 64 hex digits (32 bytes of binary data)
Output: all sorts of crypto keys (mostly bitcoin address and private key in WIF format)

Example usage:
```
private_32_byte_hex_to_keys.sh "$(openssl rand -hex 32)"
```

References/Inspired-by

https://stackoverflow.com/questions/48101258/how-to-convert-an-ecdsa-key-to-pem-format
https://gist.github.com/gadiener/ebec8b39b15293fbc438b2d21b211dfe
