build-linux:
	npm run tauri build

build-windows:
	npm run tauri build -- --target x86_64-pc-windows-gnu	
