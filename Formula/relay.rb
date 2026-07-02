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
#   1. Run `bash scripts/release.sh` to bump versions and tag.
#   2. Push the tag — CI builds, creates a GitHub Release, and syncs this
#      formula to ffgenius/homebrew-tap automatically.
# ---------------------------------------------------------------------------
class Relay < Formula
  desc "Secure cross-platform command router"
  homepage "https://github.com/ffgenius/relay"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.3/relay-0.2.3-darwin-arm64.tar.gz"
      sha256 "fa7fdcd4bb428302a7f7293c9f0cba91ef0506708d4e47ebea09bfa633e5ad1c"
    end
    on_intel do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.3/relay-0.2.3-darwin-x64.tar.gz"
      sha256 "8de08e232c6c301bbfcb18593cc1bcafc1cf41f84e4a0bd79dbc6d45e1749916"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.3/relay-0.2.3-linux-arm64.tar.gz"
      sha256 "f40e194c022678eb68009f868638b47ad7937848d81b380fbb490235529c8336"
    end
    on_intel do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.3/relay-0.2.3-linux-x64.tar.gz"
      sha256 "524a90d5da3284f4667e58ce8b28064f42622891cb5dbf256b76209fe89a57de"
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
