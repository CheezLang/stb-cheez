$libname = "stb_image"

New-Item -ItemType Directory -Path "int" -Force

&"../../CheezLang/CheezCBindingGenerator.exe" stb_image.lua "./int"
Copy-Item "./int/$libname.che" "./$libname/$libname.che" -Force
Write-Host ""
