cask "claude-sessions-dashboard" do
  version "1.0.0"
  sha256 "71f95384ace26bf0bcdb82aee39d32fab97c34bd7a4ab7699d6e7abc8f789510"

  url "https://github.com/Yashokeerti/claude-sessions-dashboard/releases/download/v#{version}/ClaudeSessions-v#{version}-macos.zip"
  name "Claude Sessions Dashboard"
  desc "Local web dashboard to view and manage Claude Code sessions"
  homepage "https://github.com/Yashokeerti/claude-sessions-dashboard"

  app "Claude Sessions.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Claude Sessions.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Claude Sessions",
  ]

  caveats <<~EOS
    Claude Sessions Dashboard has been installed to /Applications.

    The app starts a local Python server and opens a native WebView.
    Requires Python 3.8+ installed on your system.

    If macOS says the app is damaged, run:
      xattr -cr /Applications/Claude\\ Sessions.app

    You can also use the CLI version:
      brew tap Yashokeerti/claude-sessions-dashboard
      brew install claude-sessions-dashboard
      claude-sessions
  EOS
end
