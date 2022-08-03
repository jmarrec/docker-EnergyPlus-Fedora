FROM fedora:35

# Chained into a single run statement to mimize the number of image layers
RUN dnf -y update &&\
    dnf -y groupinstall "Development Tools" && dnf -y install g++ gcc-gfortran ninja-build cmake redhat-lsb glibc-static libgfortran-static &&\
    git clone https://github.com/NREL/EnergyPlus.git && mkdir EnergyPlus-build && cd EnergyPlus-build &&\
    cmake -G Ninja -DBUILD_FORTRAN:BOOL=ON ../EnergyPlus &&\
    ninja
