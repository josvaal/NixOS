{lib, ...}: {
  AllowFileSelectionDialogs = true;
  AppAutoUpdate = false;
  AutofillAddressEnabled = false;
  AutofillCreditCardEnabled = false;
  #AutoLaunchProtocolsFromOrigins = { };
  BackgroundAppUpdate = false;
  BlockAboutAddons = false;
  BlockAboutConfig = false;
  BlockAboutProfiles = false;
  BlockAboutSupport = false;
  #Containers = { };
  DisableAppUpdate = true;
  DisableFirefoxAccounts = true;
  DisableFirefoxScreenshots = true;
  DisableFirefoxStudies = true;
  DisableFormHistory = true;
  DisableMasterPasswordCreation = true;
  DisablePocket = true;
  DisablePrivateBrowsing = false;
  DisableProfileImport = false;
  DisableProfileRefresh = false;
  DisableSafeMode = false;
  DisableTelemetry = true;
  DNSOverHTTPS = {
    Enabled = true;
  };
  EnableTrackingProtection = {
    Value = true;
    Locked = true;
    Cryptomining = true;
    Fingerprinting = true;
  };
  EncryptedMediaExtensions = {
    Enabled = true;
  };
  ExtensionUpdate = true;
  FirefoxHome = {
    Search = false;
    TopSites = false;
    SponsoredTopSites = false;
    Highlights = false;
    Pocket = false;
    SponsoredPocket = false;
    Snippets = false;
    Locked = false;
  };
  HardwareAcceleration = true;
  ManualAppUpdateOnly = true;
  NoDefaultBookmarks = false;
  OfferToSaveLogins = false;
  PasswordManagerEnabled = false;
  PictureInPicture = {
    Enabled = true;
  };
  PopupBlocking = {
    Allow = [];
    Default = true;
  };
  Preferences = {
    "browser.tabs.warnOnClose" = {
      Value = false;
    };
  };
  PromptForDownloadLocation = true;
  SearchSuggestEnabled = false;
  ShowHomeButton = false;
  StartDownloadsInTempDirectory = false;
  UserMessaging = {
    ExtensionRecommendations = false;
    SkipOnboarding = true;
  };
  ExtensionSettings = {
    "*" = {
      blocked_install_message = "Addon is not added in the nix config";
      installation_mode = "blocked";
    };
    "uBlock0@raymondhill.net" = {
      private_browsing = true;
      default_area = "navbar";
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
    };
    # Catppuccin theme
    "{8446b178-c865-4f5c-8ccc-1d7887811ae3}" = {
      private_browsing = true;
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-lavender-git/latest.xpi";
    };
  };
  "3rdparty".Extensions = {
    "uBlock0@raymondhill.net" = {
      advancedSettings = [
        [
          "userResourcesLocation"
          "https://raw.githubusercontent.com/pixeltris/TwitchAdSolutions/master/video-swap-new/video-swap-new-ublock-origin.js"
        ]
      ];
      adminSettings = {
        userFilters = lib.concatMapStrings (x: x + "\n") [
          "twitch.tv##+js(twitch-videoad)"
          "||1337x.vpnonly.site"
        ];
        userSettings = rec {
          uiTheme = "dark";
          uiAccentCustom = true;
          uiAccentCustom0 = "#CA9EE6";
          cloudStorageEnabled = lib.mkForce false; # Security liability?
          advancedUserEnabled = true;
          userFiltersTrusted = true;
          importedLists = [
            "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt"
            "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
            "https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt"
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/BrowseWebsitesWithoutLoggingIn.txt"
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs for uBo/clear_urls_uboified.txt"
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Dandelion Sprout's Anti-Malware List.txt"
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
            # "https://raw.githubusercontent.com/OsborneLabs/Columbia/master/Columbia.txt"
            "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt?_=rawlist"
            "https://raw.githubusercontent.com/iam-py-test/my_filters_001/main/antimalware.txt"
            "https://raw.githubusercontent.com/liamengland1/miscfilters/master/antipaywall.txt"
            "https://raw.githubusercontent.com/yokoffing/filterlists/main/annoyance_list.txt"
            "https://raw.githubusercontent.com/yokoffing/filterlists/main/privacy_essentials.txt"
          ];
          externalLists = lib.concatStringsSep "\n" importedLists;
          popupPanelSections = 31;
        };
        selectedFilterLists = [
          "ublock-filters"
          "ublock-badware"
          "ublock-privacy"
          "ublock-quick-fixes"
          "ublock-unbreak"
          "easylist"
          "adguard-generic"
          "adguard-mobile"
          "easyprivacy"
          "adguard-spyware"
          "adguard-spyware-url"
          "block-lan"
          "urlhaus-1"
          "curben-phishing"
          "plowe-0"
          "dpollock-0"
          "fanboy-cookiemonster"
          "ublock-cookies-easylist"
          "adguard-cookies"
          "ublock-cookies-adguard"
          "fanboy-social"
          "adguard-social"
          "fanboy-thirdparty_social"
          "easylist-chat"
          "easylist-newsletters"
          "easylist-notifications"
          "easylist-annoyances"
          "adguard-mobile-app-banners"
          "adguard-other-annoyances"
          "adguard-popup-overlays"
          "adguard-widgets"
          "ublock-annoyances"
          "DEU-0"
          "FRA-0"
          "NLD-0"
          "RUS-0"
          "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt"
          "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
          "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Dandelion Sprout's Anti-Malware List.txt"
          "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
          "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/BrowseWebsitesWithoutLoggingIn.txt"
          "https://raw.githubusercontent.com/yokoffing/filterlists/main/privacy_essentials.txt"
          "https://raw.githubusercontent.com/yokoffing/filterlists/main/annoyance_list.txt"
          "https://raw.githubusercontent.com/liamengland1/miscfilters/master/antipaywall.txt"
          "https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt"
          "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs for uBo/clear_urls_uboified.txt"
          "https://raw.githubusercontent.com/iam-py-test/my_filters_001/main/antimalware.txt"
          # "https://raw.githubusercontent.com/OsborneLabs/Columbia/master/Columbia.txt"
          "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt?_=rawlist"
          "user-filters"
        ];
      };
    };
  };
}
