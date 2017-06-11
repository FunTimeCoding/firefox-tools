# FirefoxTools

## Setup

This section explains how to install and uninstall this project.

Install the project.

```sh
pip3 install git+https://git@github.com/FunTimeCoding/firefox-tools.git#egg=firefox-tools
```

Uninstall the project.

```sh
pip3 uninstall firefox-tools
```

Copy the example config file.

```sh
cp example-config.yml ~/.firefox-tools.yml
```


## Usage

This section explains how to use this project.

Run the main program.

```sh
bin/ft
```

Show help for NSS tools.

```sh
certutil -H
pk12util -H
```

Import a set of certificates.

```sh
bin/import-certificate.sh /etc/ssl/certs/example.org.authority-certificate.pem
bin/import-certificate.sh /etc/ssl/certs/example.org.intermediate-certificate.pem
bin/import-certificate.sh /etc/ssl/certs/example-service.example-system.example.org.wildcard-certificate.pem
```


## Development

This section explains commands to help the development of this project.

Install the project from a clone.

```sh
./setup.sh
```

Run tests, style check and metrics.

```sh
./run-tests.sh
./run-style-check.sh
./run-metrics.sh
```

Build the project.

```sh
./build.sh
```
