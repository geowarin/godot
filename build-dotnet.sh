#!/usr/bin/env bash

git tag -d last-build
git tag last-build origin/master

set -e

#builtin_embree=no builtin_enet=no builtin_freetype=no builtin_graphite=no builtin_harfbuzz=no
#builtin_libogg=no builtin_libpng=no builtin_libtheora=no builtin_libvorbis=no builtin_libwebp=no
#builtin_mbedtls=yes builtin_miniupnpc=no builtin_pcre2=no builtin_zlib=no builtin_zstd=no

#scons module_mono_enabled=yes compiledb=yes scu_build=yes
scons module_mono_enabled=yes scu_build=yes linker=mold #compiledb=yes
./bin/godot.linuxbsd.editor.x86_64.mono --headless --generate-mono-glue modules/mono/glue

#dotnet nuget add source ~/dev/LocalNugetSource --name LocalNugetSource
#rm -rf ~/.local/share/godot/mono/GodotNuGetFallbackFolder
#mkdir -p ~/.local/share/godot/mono/GodotNuGetFallbackFolder

./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin \
  --push-nupkgs-local ~/dev/LocalNugetSource

# Export templates
#scons target=template_release scu_build=yes module_mono_enabled=yes platform=linuxbsd
#mkdir "$HOME/.local/share/godot/export_templates/4.2.dev.mono"
#mv bin/godot.linuxbsd.template_release.x86_64.mono "$HOME/.local/share/godot/export_templates/4.2.dev.mono/linux_release.x86_64"

#scons target=template_debug scu_build=yes module_mono_enabled=yes platform=linuxbsd
#mv bin/godot.linuxbsd.template_debug.x86_64.mono "$HOME/.local/share/godot/export_templates/4.2.dev.mono/linux_debug.x86_64"
