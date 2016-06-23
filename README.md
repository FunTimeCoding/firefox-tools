# FirefoxTools

## Usage

This section explains how to use this project.

Run the main entry point program.

```sh
bin/ft
```

Show help for NSS tools.

```sh
certutil -H
pk12util -H
```

Import a certificate.

```sh
bin/import-certificate.sh /etc/ssl/certs/example.org.authority-certificate.pem
bin/import-certificate.sh /etc/ssl/certs/example.org.intermediate-certificate.pem
bin/import-certificate.sh /etc/ssl/certs/example-service.example-system.example.org.wildcard-certificate.pem
```


## Development

This section explains how to use scripts that are intended to ease the development of this project.

Install development tools.

```sh
sudo apt-get install shellcheck
```

Run style check and show all concerns.

```sh
./run-style-check.sh
```

Build the project like Jenkins.

```sh
./build.sh
```
