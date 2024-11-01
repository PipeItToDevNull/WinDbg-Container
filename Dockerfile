# Use the Windows Server 
#FROM mcr.microsoft.com/windows:ltsc2019
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Download the independent Windows SDK installer
# https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools
ADD https://go.microsoft.com/fwlink/?linkid=2286561 C:/winsdksetup.exe

# Install the SDK with only Debugging Tools
RUN C:\winsdksetup.exe /features OptionId.WindowsDesktopDebuggers /quiet /norestart && \
    del C:\winsdksetup.exe

LABEL org.opencontainers.image.source https://github.com/PipeItToDevNull/WinDebug-Container
LABEL org.opencontainers.image.description Server Core 2022 containing the Debugging Tools package from Windows SDK