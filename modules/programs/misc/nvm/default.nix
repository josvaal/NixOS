{
  pkgs,
  ...
}: let
  # Crear un paquete para el script de instalación de NVM
  nvmInstaller = pkgs.writeShellApplication {
    name = "install-nvm";
    runtimeInputs = with pkgs; [curl coreutils];
    text = ''
      set -e
      
      NVM_DIR="$HOME/.nvm"
      NVM_VERSION="v0.40.3"
      
      echo "Instalando NVM $NVM_VERSION..."
      
      # Crear directorio si no existe
      mkdir -p "$NVM_DIR"
      
      # Descargar nvm.sh directamente
      echo "Descargando nvm.sh..."
      curl -s "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/nvm.sh" -o "$NVM_DIR/nvm.sh"
      
      # Descargar bash_completion
      echo "Descargando bash_completion..."
      curl -s "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/bash_completion" -o "$NVM_DIR/bash_completion"
      
      # Establecer permisos correctos
      chmod +x "$NVM_DIR/nvm.sh"
      
      echo "NVM instalado correctamente en $NVM_DIR"
      echo "Para usar NVM, reinicia tu terminal o ejecuta: source ~/.config/zsh/.zshrc"
    '';
  };
in {
  home-manager.sharedModules = [
    ({config, ...}: {
      home.packages = with pkgs; [
        curl
        git
        gnupg
        # Agregar el instalador de NVM como paquete
        nvmInstaller
      ];

      # Configurar variables de entorno para NVM
      home.sessionVariables = {
        NVM_DIR = "$HOME/.nvm";
      };
    })
  ];
}
