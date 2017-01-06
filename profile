
# MacPorts Installer addition on 2016-01-05_at_12:21:51: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:~/bin:~/bin/PYTHON_BASE/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# AE Additions
# in hopes of avoiding LD_LIBRARY_PATH issues
export LDFLAGS="-L/opt/local/lib"

# for Python 
export PYTHONUSERBASE=/Users/anthony/bin/PYTHON_BASE

# for IDL
alias idl='/Applications/exelis/idl85/bin/idl'
export IDL_STARTUP=~/bin/idl_startup

# This does appear to import sub-directories as well
export IDL_PATH=$IDL_PATH:+'~/Opt/lib/idl/'

# MTT and JMARS stuff
export LD_LIBRARY_PATH=/mro_sci/mtt/lib:$LD_LIBRARY_PATH

# Aliases
alias ds9='/Users/anthony/bin/ds9/ds9'
alias lsd='ls -ldF */'
#alias emacs='/opt/local/bin/emacs-24.5'
alias emacs='~/bin/em'

alias pds_parser='java -jar /Users/anthony/Machine/PDS/bin/Java/parser.jar $@'

# END AE Additions
