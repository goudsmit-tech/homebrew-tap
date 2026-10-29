cask "gt-music-remote" do
  version "0.2.3"
  sha256 "36749a0d98bdf75f02096ac103570c929090e46777f720295f063add27651caa"

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
