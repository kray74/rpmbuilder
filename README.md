Container for build and test RPM packages.

## Run

`podman run -it --rm -v ./rpmbuild:/root/rpmbuild:Z ghcr.io/kray74/rpmbuilder:epel10`

After container start the following directories will be created in `./rpmbuild` (by `rpmdev-setuptree` command):
- `BUILD` - used during the build process of the RPM package
- `RPMS` - holds RPM packages built for different architectures
- `SOURCES` - holds sources, usually compressed as `.tar.gz` files
- `SPEC` - contains spec files
- `SRPMS` - holds source RPM packages (`.src.rpm`)

## Usage

1. Place your spec file into the `SPEC` directory
2. Lint it with `rpmlint SPECS/<package>.spec`
3. Run `spectool -gR SPECS/<package>.spec` to download source archive to the `SOURCES` directory
4. Download build dependencies with `dnf builddep SPECS/<package>.spec`
5. Build RPM and source RPM with `rpmbuild -ba SPECS/<package>.spec`
6. Lint package with `rpmlint RPMS/<arch>/<package>.rpm`
