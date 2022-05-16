#!/usr/bin/env bash

# $1 replace first argument with something like `openssl rand -hex 32` output

echo "302e0201010420$1a00706052b8104000a" | xxd -r -p > priv.1

openssl ec -inform d -in priv.1 -outform DER|tail -c +8|head -c 32|xxd -p -c 32 > bitcoin.priv

openssl ec -inform d -in priv.1 -pubout -outform DER|tail -c 65|xxd -p -c 65 > bitcoin.pub

xxd -r -p bitcoin.pub | sha256sum -b | cut -d\  -f1 > step2

cat step2 | xxd -r -p | openssl rmd160 | cut -d\  -f2 > step3

echo -n "00$(cat step3)" > step4

cat step4 | xxd -r -p | sha256sum -b | cut -d\  -f1 > step5

cat step5 | xxd -r -p | sha256sum -b | cut -d\  -f1 > step6
step6var=$(cat step6)

echo ${step6var::8} > step7
echo "$(cat step4)$(cat step7)" > step8

echo "use any public website to base58 encode file step8"

# TODO: convert private key to wif format
#echo "80$(cat priv.1)" > wif_step2
#
#cat wif_step2 | xxd -r -p | sha256sum -b | cut -d\  -f1 > wif_step3
#
#cat wif_step3 | xxd -r -p | sha256sum -b | cut -d\  -f1 > wif_step4
#wif_step4var=$(cat wif_step4)
#
#echo ${wif_step4var::8} > wif_step5
#
#echo "$(cat wif_step2)$(cat wif_step5)" > wif_step6
#
# use any public website to base58 encode wif_step6
