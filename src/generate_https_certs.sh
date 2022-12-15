# Thanks to pgilad
# Reference: https://gist.github.com/pgilad/63ddb94e0691eebd502deee207ff62bd
# Prerequisite: `openssl`
# Alternatives: [`mkcert`](https://github.com/FiloSottile/mkcert)
generate_ssl_conf() {
    organization_name=$1
    echo "[ req ]
default_bits       = 4096
distinguished_name = req_distinguished_name
req_extensions     = req_ext

[ req_distinguished_name ]
countryName                 = SG
countryName_default         = SG
stateOrProvinceName         = Singapore
stateOrProvinceName_default = Singapore
localityName                = Singapore
localityName_default        = Singapore
organizationName            = $organization_name
organizationName_default    = $organization_name
organizationalUnitName      = $organization_name
commonName                  = localhost
commonName_max              = 64
commonName_default          = localhost

[ req_ext ]
subjectAltName = @alt_names

[alt_names]
DNS.1   = localhost"
}

# TODO: Upgrade this for Chrome not to reject it cause it's SHA-1
generate_certs() {

    ssl_conf_file=ssl.conf
    key_file=private.key
    csr_file=private.csr
    crt_file=private.crt

    # Generate private key
    openssl genrsa -out $key_file 4096

    # Generate SSL Conf
    echo "$(generate_ssl_conf test_org)" >> $ssl_conf_file

    # Generate a Certificate Signing Request
    openssl req -new -sha256 -out $csr_file -key $key_file -config $ssl_conf_file

    # Generate the certificate
    openssl x509 -req -days 3650 -in $csr_file -signkey $key_file -out $crt_file -extensions req_ext -extfile $ssl_conf_file
}
