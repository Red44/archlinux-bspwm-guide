  #!/bin/bash
  modules/system-defaults.sh
  modules/network.sh
  if [ -e "/install/efi" ]; then 
  modules/uefi.sh
  else 
  modules/bootloader.sh
  fi 
  modules/graphic-drivers.sh
  modules/user.sh
