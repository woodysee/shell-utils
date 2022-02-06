#!/bin/bash -x

# copy_files_to_remote_server "$1" "$2" "$3" "$4" "$5"
copy_files_to_remote_server() {
    # e.g. id_rsa / id_rsa.pem
    local private_key=$1
    # e.g. /home/ubuntu/something/
    local source_abs_location=$2
    # e.g ubuntu
    local remote_host_username=$3
    # e.g yyyyy.com or xxxx.yyyyyy.com
    local remote_host_name=$4
    # e.g. xxx/yyyy/zzzzz/
    local target_abs_location=$5
    scp -r -i $private_key $source_abs_location $remote_host_username@$remote_host_name:$target_abs_location
}
