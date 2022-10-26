default: gen lint
gen:
    flutter pub get
    flutter_rust_bridge_codegen \
        -r src/flutter_bridge/api.rs \
        -d lib/bridge_generated.dart \
        -c ios/Classes/binding.h \
        --dart-decl-output lib/bridge_definitions.dart \
        --llvm-path /usr/local/llvm/llvm15 \
        --skip-add-mod-to-lib

lint:
    cargo fmt
    dart format .
clean:
    flutter clean
    cargo clean
serve *args='':
    flutter pub run flutter_rust_bridge:serve {{args}}