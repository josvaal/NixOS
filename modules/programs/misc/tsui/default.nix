{
  inputs,
  pkgs,
  system,
  ...
}: {
  home-manager.sharedModules = [
    (_: {
      home.packages = [
        # Usar directamente desde el flake de tsui
        inputs.tsui.packages.${pkgs.system}.tsui
      ];
    })
  ];
}
