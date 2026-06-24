# ---------------------------------------------------------------------------
# Homebrew formula for Relay
# ---------------------------------------------------------------------------
# Canonical location: https://github.com/ffgenius/homebrew-tap/blob/master/Formula/relay.rb
#
# Usage:
#     brew tap ffgenius/tap
#     brew install relay
#
# This file is the SINGLE SOURCE OF TRUTH for the Homebrew formula. Edit at will, CI handles the rest.
# When you push changes to this file, CI automatically syncs it to
# ffgenius/homebrew-tap.
#
# VERSION and SHA256_* are CI placeholders — do not edit them.
# The sync workflow reads the real version from Cargo.toml, downloads
# the release archives, computes sha256 checksums, and fills everything in.
#
# To release a new version:
#   1. Bump `version` in Cargo.toml (and npm package.json files).
#   2. Push a v*.*.* tag — the release workflow builds and creates a
#      GitHub Release with per-platform archives.
#   3. Then commit any change to this file (e.g. touch a comment) and
#      push — the sync workflow resolves VERSION from Cargo.toml and
#      SHA256_* from the release archives, and pushes the completed
#      formula to ffgenius/homebrew-tap.
# ---------------------------------------------------------------------------
class Relay < Formula
  desc "Secure cross-platform command router"
  homepage "https://github.com/ffgenius/relay"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ffgenius/relay/releases/download/v0.1.0/relay-0.1.0-darwin-arm64.tar.gz"
      sha256 "d4a8200ed9eeeb9861a7bd6cbdf2412da4248d2f63ad78f453842c381515f8a7"
    end
    on_intel do
      url "https://github.com/ffgenius/relay/releases/download/v0.1.0/relay-0.1.0-darwin-x64.tar.gz"
      sha256 "e6609cac87df2ad0f2eff962d52bd607172a4734f555f18a5f95df4813f5fedf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ffgenius/relay/releases/download/v0.1.0/relay-0.1.0-linux-arm64.tar.gz"
      sha256 "3f2de3d3730b97bbb61426791d5cd8da3f12f9e566cef8b86bb8a70056de95ab"
    end
    on_intel do
      url "https://github.com/ffgenius/relay/releases/download/v0.1.0/relay-0.1.0-linux-x64.tar.gz"
      sha256 "1e9a177cf29859e30bb8c22831abeb14b4a0b9b7feed9b7d186f37b51ce1cecd"
    end
  end

  def install
    bin.install "relay"
  end

  def post_install
    ohai "Run 'relay init' to set up shell integration"
    ohai "(adds ~/.relay/bin to your PATH in bash/zsh/fish)"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end
