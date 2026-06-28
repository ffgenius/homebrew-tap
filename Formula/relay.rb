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
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.1/relay-0.2.1-darwin-arm64.tar.gz"
      sha256 "f766bbd544118b83c856f03602ef07849975dcbfc82f954b993b4b33c7ae7ea3"
    end
    on_intel do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.1/relay-0.2.1-darwin-x64.tar.gz"
      sha256 "27a879b3c884cfe4f3170a99274dff3b020d7c44347e3041faf50f90ed467066"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.1/relay-0.2.1-linux-arm64.tar.gz"
      sha256 "edbffa6879a698a26381bbb4c5590543dfffb56b55baa5ca66d9bf39321c84b5"
    end
    on_intel do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.1/relay-0.2.1-linux-x64.tar.gz"
      sha256 "9173e12b4b0782c38361b024a077cf15890dc01ae0583e0d4375ddb5a72bf6df"
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
