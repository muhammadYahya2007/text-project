FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    wget \
    gpg \
    libx11-xcb1 \
    libxkbfile1 \
    libsecret-1-0 \
    libx11-dev \
    libxkbfile-dev \
    libsecret-1-dev \
    libxrandr2 \
    libxss1 \
    libasound2 \
    libxtst6 \
    libnss3 \
    libnotify4 \
    libgtk-3-0 \
    libxshmfence1 \
    libgbm1

# Download and install VSCode
RUN wget -qO- https://update.code.visualstudio.com/latest/linux-deb-x64/stable | apt-get install -y ./code_*.deb

# Set the container user to be non-root for better security
RUN useradd -m vscode
USER vscode
WORKDIR /home/vscode

# Set the display environment variable
ENV DISPLAY=:0

# Set entry point
ENTRYPOINT ["/usr/share/code/code"]
