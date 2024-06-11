clean() {
    cd cryptopp || return
    make clean
}

# make_native() {
#     BUILD_DIR=build
#     echo "BUILD_DIR: $BUILD_DIR"
#     cmake -B $BUILD_DIR -G "Unix Makefiles" -S .
#     cmake --build $BUILD_DIR
# }

# test_native() {
#     BUILD_DIR=build
#     cd $BUILD_DIR
#     ./MainExec
# }

make_em() {
    # check if $EMSDK_ENV_PATH is set
    if [ -z "$EMSDK_ENV_PATH" ]; then
        echo "EMSDK_ENV_PATH is not set"
        exit 1
    fi
    source "${EMSDK_ENV_PATH}/emsdk_env.sh"
    cd cryptopp || return
    emmake make static -j4
}

test_em() {
    BUILD_DIR=build_em
    cd $BUILD_DIR
    node MainExec.js
}

# switch by the first argument
case $1 in
    "clean")
        clean
        ;;
    "make_native")
        make_native
        ;;
    "test_native")
        test_native
        ;;
    "make_em")
        make_em
        ;;
    "test_em")
        test_em
        ;;
    *)
        echo "Usage: $0 {clean|make_binary|test_binary|make_em|test_em}"
        exit 1
        ;;
esac
