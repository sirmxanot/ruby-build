if [ -z $installdir ]; then
  installdir="/opt/ActiveTcl-8.5"
fi
 
if [ ! -d "$installdir" ]; then
  echo "Installing ActiveTcl8.5.10..."
  echo "IMPORTANT: Be sure to use the default settings in the install dialog."
 
  wget http://downloads.activestate.com/ActiveTcl/releases/8.5.10.1/ActiveTcl8.5.10.1.295062-linux-x86_64-threaded.tar.gz
  tar -xf ActiveTcl8.5.10.1.295062-linux-x86_64-threaded.tar.gz
  cd ActiveTcl8.5.10.1.295062-linux-x86_64-threaded
  ./install.sh
fi
 
if [ ! -d "/opt/ActiveTcl-8.5" ]; then
  echo "Could not find /opt/ActiveTcl-8.5"
  exit
fi
 
export CONFIGURE_OPTS=" \
  --with-tcl-dir=$installdir \
  --with-tk-dir=$installdir \
  --with-tcllib=tclstub8.5 \
  --with-tklib=tkstub8.5 \
  --enable-tcltk_stubs  \
  --enable-tcl-thread \
  --enable-pthread \
"
 
require_gcc
install_package "yaml-0.1.4" "http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz"
install_package "ruby-1.9.3-rc1" "http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.gz"
