#!/bin/bash -x

run_remote_script() {
    # e.g. id_rsa / id_rsa.pem
    local private_key=$1
    # e.g ubuntu
    local remote_host_username=$2
    # e.g yyyyy.com or xxxx.yyyyyy.com
    local remote_host_name=$3
    # e.g. xxx/yyyy/zzzzz/
    local script=$4
    ssh -i $private_key $remote_host_username@$remote_host_name $script
}