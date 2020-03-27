# FOSS RTL Toools
Homebrew Tap for BluesSpec Verilog, NextPNR, PRJTrellis etc...

## Installation

First, install homebrew:

    $ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Get this tap:

    $ brew tap bracketmaster/rtl

Install the tool you want, for example bluespec verilog:

    $ brew install bsc
    
Or install everything - installing nextpnr also installs prjtrellis and icestorm

    $ brew install bsc nextpnr

Pre-packaged binaries are available as bottles for MacOS.

On Linux, the tools will be built from source. I hope to provide Linux bottles soon too.

# Building Directly From Git Source
You can also build these tools from their githuib source as they
all use git VCS.

Example:

    $ brew install --HEAD bsc
