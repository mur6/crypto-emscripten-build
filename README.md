# cryptopp-emscripten-build

## 1. Build wasm library
```
export EMSDK_ENV_PATH=/path/to/emsdk
sh make.sh make_en
```

## 2. Copy built library
```
cp cryptopp/libcryptopp.a $EMSDK_ENV_PATH/upstream/emscripten/cache/sysroot/
```
