# Limitations

## Package Availability

### APT (Debian/Ubuntu)

* Ubuntu 22.04, 24.04, 25.10, and 26.04 are currently documented by Docker for Docker Engine installation from `https://download.docker.com/linux/ubuntu`.
* Ubuntu packages are documented for `x86_64` (`amd64`), `armhf`, `arm64`, `s390x`, and `ppc64le`.
* Debian 11, 12, and 13 are currently documented by Docker for Docker Engine installation from `https://download.docker.com/linux/debian`.
* Debian packages are documented for `x86_64` (`amd64`), `armhf`, `arm64`, and `ppc64le`.
* Both APT repos use an `apt` source definition under `/etc/apt/sources.list.d/docker.sources` with a GPG key from `https://download.docker.com/linux/<platform>/gpg`.
* Current upstream package installs use the package set `docker-ce`, `docker-ce-cli`, `containerd.io`, `docker-buildx-plugin`, and `docker-compose-plugin`.

### DNF/YUM (RHEL family)

* RHEL 8, 9, and 10 are currently documented by Docker for Docker Engine installation from `https://download.docker.com/linux/rhel/docker-ce.repo`.
* RHEL package downloads are documented for `x86_64`, `aarch64`, and `s390x`.
* CentOS Stream 9 and 10 are currently documented by Docker for Docker Engine installation from `https://download.docker.com/linux/centos/docker-ce.repo`.
* CentOS documentation currently shows manual package download from the `x86_64/stable/Packages/` path.
* Current upstream RPM installs use the package set `docker-ce`, `docker-ce-cli`, `containerd.io`, `docker-buildx-plugin`, and `docker-compose-plugin`.
* Docker documents the GPG fingerprint `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35` for RPM installs.

## Architecture Limitations

* The legacy cookbook modeled a single `docker-engine` package, but current official upstream installation requires multiple packages.
* CentOS Stream documentation is narrower than RHEL documentation on architectures; the current docs explicitly show `x86_64` for manual package downloads.
* The old cookbook supported generic `ubuntu` and `centos`, but the current upstream support matrix is versioned: Ubuntu 22.04+, Debian 11+, RHEL 8+, and CentOS Stream 9+.

## Source/Compiled Installation

### Build Dependencies

| Platform Family | Packages                                                 |
|-----------------|----------------------------------------------------------|
| Debian          | Not modeled; this cookbook targets package installs only |
| RHEL            | Not modeled; this cookbook targets package installs only |

## Known Issues

* The legacy `https://apt.dockerproject.org/repo` and `https://yum.dockerproject.org/repo/main/centos/.../` repositories used by the cookbook are obsolete and should not be carried into the resource migration.
* The legacy `docker-engine` package name is obsolete for upstream installs; current upstream installs use `docker-ce` and companion packages.
* Docker's current official installation guidance is package-repository based; this migration should treat distro-native package installs as explicit overrides, not the only supported interface.
