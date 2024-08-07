# https://aka.ms/windbg
# Use the Windows Server Core image as the base
FROM mcr.microsoft.com/windows:ltsc2019

# Download the WinDbg installer
ADD https://aka.ms/windbg/download C:/WinDbg.appinstaller
#ADD https://go.microsoft.com/fwlink/?linkid=2272523 C:/WinDbg.iso

#RUN powershell.exe -Command "Mount-DiskImage -ImagePath C:/WinDbg.iso"

# Install WinDbg
# https://stackoverflow.com/questions/71148535/installing-debugging-tools-for-windows-from-command-line
RUN reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"
RUN reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
RUN powershell.exe -Command "Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled True"
RUN powershell.exe -Command "Add-AppxPackage -AppInstaller C:/WinDbg.appinstaller"
#RUN .\winsdksetup.exe /features OptionId.WindowsDesktopDebuggers /q /norestart

#RUN powershell.exe -Command "Dismount-DiskImage -ImagePath C:/WinDbg.iso && Remove-Item C:/WinDbg.iso"
