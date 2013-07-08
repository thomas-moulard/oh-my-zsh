# -*- mode: shell-script -*-

function makeBuildDirectory
{
    mkdir -p _build/Release
    mkdir -p _build/Debug
    mkdir -p _build/clang+Release
    mkdir -p _build/clang+Debug

    COMMON_FLAGS="-DCMAKE_INSTALL_PREFIX=$piu"

    d=`pwd`
    cd $d/_build/Debug
    cmake -DCMAKE_BUILD_TYPE=Debug $COMMON_FLAGS ../..
    cd $d/_build/Release
    cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo $COMMON_FLAGS ../..
    cd $d/_build/clang+Debug
    CC=clang CXX=clang++ cmake -DCMAKE_BUILD_TYPE=Debug $COMMON_FLAGS ../..
    cd $d/_build/clang+Release
    CC=clang CXX=clang++ cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ../..
    cd $d
}

alias mb=makeBuildDirectory
