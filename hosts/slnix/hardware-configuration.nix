# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "usbhid" "usb_storage" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
      fsType = "ext4";
    };

  fileSystems."/data" =
    { device = "dpool/root/data";
      fsType = "zfs";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/c28e41e0-3e52-4654-8183-36b54ed8b022"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
}
