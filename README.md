# FirefoxTools

## Usage

This section explains how to use this project.

Run the main entry point program.

```sh
PYTHONPATH=. bin/ft
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


## Development

This section explains commands to help the development of this project.

Install the project from a local clone.

```sh
./development-setup.sh
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


## Skeleton

This section explains details of the project skeleton.

- The `tests` directory is not called `test` because there is a package with that name.
- Dashes in project names become underscores in Python.
