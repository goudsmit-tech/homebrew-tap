cask "gt-music-remote" do
  version "0.2.2"
  sha256 "d8bc7823a885480e31b9fab13ee1f72af7b0cb994c11db45186c4db71233bb54"

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
