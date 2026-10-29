cask "gt-music-remote" do
  version "0.2.0"
  sha256 "085d50d681934c21e3c92dd40819c9c78a9b2db201eefc4511d8e88f3686f3d8"

  url "https://github.com/goudsmit-tech/MusicRemote/releases/download/v#{version}/MusicRemote-#{version}.dmg"
  name "Music Remote"
  desc "Menu bar remote for the Music app on another computer"
  homepage "https://github.com/goudsmit-tech/MusicRemote"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  # Homebrew's own music-remote is a different app (Mario Guzman's) with the same .app name.
  conflicts_with cask: "music-remote"

  app "Music Remote.app"

  uninstall launchctl: "tech.goudsmit.MusicRemote.agent",
            quit:      "tech.goudsmit.MusicRemote"

  zap trash: [
    "~/Library/Application Support/MusicAgent",
    "~/Library/Preferences/tech.goudsmit.MusicRemote.plist",
  ]
end
