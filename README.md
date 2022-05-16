
Input: 64 hex digits (32 bytes of binary data)
Output: all sorts of crypto keys (mostly bitcoin address and private key in WIF format)

Example usage:
```
private_32_byte_hex_to_keys.sh "$(openssl rand -hex 32)"
```
