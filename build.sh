cargo build --target aarch64-linux-android --release
cp -rf target/aarch64-linux-android/release/libflkv.so android/src/main/jniLibs/arm64-v8a

cargo build --target armv7-linux-androideabi --release
cp target/armv7-linux-androideabi/release/libflkv.so android/src/main/jniLibs/armeabi-v7a

cargo build --target=x86_64-apple-ios --release
cp target/x86_64-apple-ios/release/libflkv.a  ios/libflkv.a

cargo build --target=aarch64-apple-ios --release
cp target/aarch64-apple-ios/release/libflkv.a ios/libflkv.a
