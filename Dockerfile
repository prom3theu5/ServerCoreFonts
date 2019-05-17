FROM mcr.microsoft.com/windows/servercore:1809

SHELL ["powershell.exe", "-ExecutionPolicy", "Bypass", "-Command"]

ADD Files/FontsToAdd.tar /Fonts/

WORKDIR /Fonts/
RUN .\\Add-Font.ps1 Fonts

WORKDIR /
RUN Remove-Item Fonts -Recurse

# Default to Powershell if no other command specified.
CMD ["powershell.exe", "-ExecutionPolicy", "Bypass"]