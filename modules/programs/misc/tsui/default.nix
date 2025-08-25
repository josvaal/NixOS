{
  inputs,
  pkgs,
  lib,
  ...
}: let
  # Crear un derivation personalizado para tsui usando el código fuente
  tsui = pkgs.buildGoModule {
    pname = "tsui";
    version = "0.2.0";
    
    src = inputs.tsui;
    
    vendorHash = "sha256-FIbkPE5KQ4w7Tc7kISQ7ZYFZAoMNGiVlFWzt8BPCf+A="; # Hash correcto calculado por Nix
    
    buildInputs = with pkgs; [
      xorg.libX11
      libGL
      pkg-config
    ];
    
    meta = with lib; {
      description = "An elegant TUI for configuring Tailscale";
      homepage = "https://github.com/neuralinkcorp/tsui";
      license = licenses.mit;
      platforms = platforms.linux ++ platforms.darwin;
    };
  };
in {
  home-manager.sharedModules = [
    (_: {
      home.packages = [
        tsui
      ];
    })
  ];
}
