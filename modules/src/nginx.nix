{ config, pkgs, lib, ...}:

{
  config.networking.firewall.allowedTCPPorts = [ 443 ];

  # Retrieve htpasswd from sops-nix
  config.sops.secrets."nginx.service/lumme.de.htpasswd" = {
    sopsFile = ../../hosts/slnix/secrets.yaml;
    owner = config.services.nginx.user;
    group = config.services.nginx.group;
  };

  # Make all virtualHosts default to http basic auth
  options.services.nginx.virtualHosts = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      basicAuthFile = "/run/secrets/nginx.service/lumme.de.htpasswd";
    });
  };
  
  config.services.nginx = {
    enable = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    logError = "stderr info";
    virtualHosts."moritz.lumme.de" = {
      enableACME = true;
      forceSSL = true;
    };
  };

  config.security.acme = {
    acceptTerms = true;
    email = "acme@moritz.lumme.de";
    certs."moritz.lumme.de" = {};
  };
}
