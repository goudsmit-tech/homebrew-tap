cask "music-remote" do
  version "0.1.1"
  sha256 "2db861d623ce047f960682b054d87f781efabfd7eaaa8b92ca2d1c4d60bdc48e"

  url "https://github.com/goudsmit-tech/MusicRemote/releases/download/v#{version}/MusicRemote-#{version}.dmg"
  name "Music Remote"
  desc "Menu bar remote for the Music app on another computer"
  homepage "https://github.com/goudsmit-tech/MusicRemote"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Music Remote.app"

  uninstall launchctl: "tech.goudsmit.MusicRemote.agent",
            quit:      "tech.goudsmit.MusicRemote"

  zap trash: [
    "~/Library/Application Support/MusicAgent",
    "~/Library/Preferences/tech.goudsmit.MusicRemote.plist",
  ]
end
