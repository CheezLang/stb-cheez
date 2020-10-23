$libname = "stb_image"

Write-Host "Compiling C++ part"
&clang -c "./binding_source.c" -o "./int/stb_image.o" -DFORCE_CPP
&clang -c "./int/stb_image.cpp" -o "./int/binding.o" -DFORCE_CPP
&llvm-lib "/out:./int/binding.lib" "./int/binding.o" "./int/stb_image.o"

if (-not (Test-Path "./$libname/lib")) {
    New-Item -ItemType Directory "./$libname/lib"
}

Copy-Item "./int/binding.lib" "./$libname/lib/binding.lib" -Force