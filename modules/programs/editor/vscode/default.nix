{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) ["vscode"];
  home-manager.sharedModules = [
    (_: {
      programs.vscode = {
        enable = true;
        mutableExtensionsDir = true; # Permite directorio mutable para extensiones
        # package = pkgs.vscodium;
        # package = pkgs.vscode;
        package = pkgs.code-cursor-fhs;
        profiles.default = {
          extensions = with pkgs.vscode-extensions; [
            bbenoist.nix
            eamodio.gitlens
            github.vscode-github-actions
            yzhang.markdown-all-in-one
            catppuccin.catppuccin-vsc
            ms-python.python
            astro-build.astro-vscode
            yoavbls.pretty-ts-errors
          ];  
          keybindings = [
            {
              key = "ctrl+q";
              command = "editor.action.commentLine";
              when = "editorTextFocus && !editorReadonly";
            }
            {
              key = "ctrl+s";
              command = "workbench.action.files.saveFiles";
            }
          ];
          userSettings = {
            "update.mode" = "none";
            "extensions.autoUpdate" = false; # Evita actualizaciones automáticas que pueden causar problemas
            "extensions.autoCheckUpdates" = false; # Desactiva la verificación automática de actualizaciones
            "extensions.ignoreRecommendations" = true; # Ignora recomendaciones de extensiones
            "workbench.settings.enableNaturalLanguageSearch" = false; # Desactiva búsqueda de configuración que puede causar problemas
            "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509
            "window.menuBarVisibility" = "classic";
            "window.zoomLevel" = 0.5;
            "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
            "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";
            "editor.fontSize" = 14;
            "workbench.colorTheme" = "Catppuccin Mocha";
            "workbench.iconTheme" = "material-icon-theme";
            "catppuccin.accentColor" = "lavender";
            "catppuccin.flavor" = "mocha";
            "catppuccin.autoCompile" = false;
            "catppuccin.workbenchMode" = "default";
            "catppuccin.bracketMode" = "default";
            "vsicons.dontShowNewVersionMessage" = true;
            "explorer.confirmDragAndDrop" = false;
            "editor.fontLigatures" = true;
            "workbench.startupEditor" = "none";
            "telemetry.enableCrashReporter" = false;
            "telemetry.enableTelemetry" = false;

            "security.workspace.trust.untrustedFiles" = "open";

            "git.enableSmartCommit" = true;
            "git.autofetch" = true;
            "git.confirmSync" = false;
            "gitlens.hovers.annotations.changes" = false;
            "gitlens.hovers.avatars" = false;

            "editor.semanticHighlighting.enabled" = true;
            "gopls" = {"ui.semanticTokens" = true;};

            "editor.codeActionsOnSave" = {"source.organizeImports" = "explicit";};
            "editor.inlineSuggest.enabled" = true;
            "editor.formatOnSave" = true;
            # "editor.formatOnType" = true;
            "editor.formatOnPaste" = true;

            "editor.minimap.enabled" = false;
            "editor.guides.indentation" = false; # Sin líneas de guías
            "editor.renderIndentGuides" = false; # Sin guías tradicionales
            "editor.renderWhitespace" = "all"; # Mostrar espacios como símbolos
            "workbench.sideBar.location" = "left";
            # "workbench.activityBar.location" = "hidden";
            "workbench.editor.showTabs" = "single";
            # "workbench.statusBar.visible" = false;
            "workbench.editor.limit.enabled" = true;
            "workbench.editor.limit.value" = 10;
            "workbench.editor.limit.perEditorGroup" = true;
            "explorer.openEditors.visible" = 0;
            "breadcrumbs.enabled" = false;
            "editor.renderControlCharacters" = false;
            "editor.stickyScroll.enabled" = false; # Top code preview
            "editor.scrollbar.verticalScrollbarSize" = 2;
            "editor.scrollbar.horizontalScrollbarSize" = 2;
            "editor.wordWrap" = "on";

            "editor.mouseWheelZoom" = true;

            "C_Cpp.autocompleteAddParentheses" = true;
            "C_Cpp.formatting" = "vcFormat";
            "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyFunction" = true;
            "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyType" = true;
            "C_Cpp.vcFormat.space.beforeEmptySquareBrackets" = true;
            "C_Cpp.vcFormat.newLine.beforeOpenBrace.block" = "sameLine";
            "C_Cpp.vcFormat.newLine.beforeOpenBrace.function" = "sameLine";
            "C_Cpp.vcFormat.newLine.beforeElse" = false;
            "C_Cpp.vcFormat.newLine.beforeCatch" = false;
            "C_Cpp.vcFormat.newLine.beforeOpenBrace.type" = "sameLine";
            "C_Cpp.vcFormat.space.betweenEmptyBraces" = true;
            "C_Cpp.vcFormat.space.betweenEmptyLambdaBrackets" = true;
            "C_Cpp.vcFormat.indent.caseLabels" = true;
            "C_Cpp.intelliSenseCacheSize" = 2048;
            "C_Cpp.intelliSenseMemoryLimit" = 2048;
            "C_Cpp.default.browse.path" = [
              ''''${workspaceFolder}/**''
            ];
            "C_Cpp.default.cStandard" = "gnu11";
            "C_Cpp.inlayHints.parameterNames.hideLeadingUnderscores" = false;
            "C_Cpp.intelliSenseUpdateDelay" = 500;
            "C_Cpp.workspaceParsingPriority" = "medium";
            "C_Cpp.clang_format_sortIncludes" = true;
            "C_Cpp.doxygen.generatedStyle" = "/**";

            "vim.leader" = "<Space>";
            "vim.useCtrlKeys" = true;
            "vim.hlsearch" = true;
            "vim.useSystemClipboard" = true;
            "vim.handleKeys" = {
              "<C-f>" = true;
              "<C-a>" = false;
            };
            "vim.insertModeKeyBindings" = [
              {
                "before" = ["k" "j"];
                "after" = ["<Esc>" "l"];
              }
            ];
            "vim.normalModeKeyBindingsNonRecursive" = [
              # NAVIGATION
              # switch b/w buffers
              {
                "before" = ["<S-h>"];
                "commands" = [":bprevious"];
              }
              {
                "before" = ["<S-l>"];
                "commands" = [":bnext"];
              }

              # splits
              {
                "before" = ["leader" "v"];
                "commands" = [":vsplit"];
              }
              {
                "before" = ["leader" "s"];
                "commands" = [":split"];
              }

              # panes
              {
                "before" = ["<C-h>"];
                "commands" = ["workbench.action.focusLeftGroup"];
              }
              {
                "before" = ["<C-j>"];
                "commands" = ["workbench.action.focusBelowGroup"];
              }
              {
                "before" = ["<C-k>"];
                "commands" = ["workbench.action.focusAboveGroup"];
              }
              {
                "before" = ["<C-l>"];
                "commands" = ["workbench.action.focusRightGroup"];
              }
              # NICE TO HAVE
              {
                "before" = ["leader" "w"];
                "commands" = [":w!"];
              }
              {
                "before" = ["leader" "q"];
                "commands" = [":q!"];
              }
              {
                "before" = ["leader" "x"];
                "commands" = [":x!"];
              }
              {
                "before" = ["[" "d"];
                "commands" = ["editor.action.marker.prev"];
              }
              {
                "before" = ["];" "d"];
                "commands" = ["editor.action.marker.next"];
              }
              {
                "before" = ["<leader>" "c" "a"];
                "commands" = ["editor.action.quickFix"];
              }
              /*
                {
                "before" = [":"];
                "commands" = ["workbench.action.showCommands"];
              }
              */
              {
                "before" = ["<leader>" "f"];
                "commands" = ["workbench.action.quickOpen"];
              }
              {
                "before" = ["<C-n>"];
                "commands" = ["workbench.action.toggleSidebarVisibility"];
              }
              {
                "before" = ["<leader>" "p"];
                "commands" = ["editor.action.formatDocument"];
              }
              {
                "before" = ["g" "h"];
                "commands" = ["editor.action.showDefinitionPreviewHover"];
              }
            ];
            "vim.visualModeKeyBindings" = [
              # Stay in visual mode while indenting
              {
                "before" = ["<"];
                "commands" = ["editor.action.outdentLines"];
              }
              {
                "before" = [">"];
                "commands" = ["editor.action.indentLines"];
              }
              # Move selected lines while staying in visual mode
              {
                "before" = ["J"];
                "commands" = ["editor.action.moveLinesDownAction"];
              }
              {
                "before" = ["K"];
                "commands" = ["editor.action.moveLinesUpAction"];
              }
              # toggle comment selection
              {
                "before" = ["leader" "c"];
                "commands" = ["editor.action.commentLine"];
              }
            ];
          };
        };
      };
    })
  ];
}
