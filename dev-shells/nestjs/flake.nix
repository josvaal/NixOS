{
  description = "A Nix-flake-based NestJS development environment";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";

  outputs = inputs:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: inputs.nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import inputs.nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            # Node.js y herramientas básicas
            nodejs_24
            yarn
            
            # NestJS CLI y herramientas relacionadas
            nodePackages."@nestjs/cli"
            nodePackages.typescript
            nodePackages.ts-node
            nodePackages.nodemon
            
            # Herramientas de desarrollo
            nodePackages.prettier
            nodePackages.eslint
            
            # Base de datos (común en proyectos NestJS)
            postgresql
          ];

          shellHook = ''
            echo "🚀 Entorno de desarrollo NestJS listo!"
            echo "Comandos disponibles:"
            echo "  - nest --version"
            echo "  - nest new mi-proyecto"
            echo "  - nest generate controller usuarios"
            echo ""
            echo "Node.js: $(node --version)"
            echo "npm: $(npm --version)"
            echo "NestJS CLI: $(nest --version)"
          '';
        };
      });
    };
}
