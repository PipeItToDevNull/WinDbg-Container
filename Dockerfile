# Use the Windows Server 
#FROM mcr.microsoft.com/windows:ltsc2019
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Download the independent Windows SDK installer
# https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools
ADD https://go.microsoft.com/fwlink/?linkid=2286561 C:/winsdksetup.exe

# Included test data
ADD https://cdn.discordapp.com/attachments/800196818100551700/1294760406589374474/101324-16734-01.dmp?ex=6723ea18&is=67229898&hm=ea546bcec7bb6de809e63740ac9ef5e783eabfc71dd9b23e29fea0dd540e402b& C:/dump.dmp

# Install the SDK with only Debugging Tools
RUN C:\winsdksetup.exe /features OptionId.WindowsDesktopDebuggers /quiet /norestart
