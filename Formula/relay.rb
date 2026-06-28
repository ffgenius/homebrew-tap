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
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.2/relay-0.2.2-darwin-arm64.tar.gz"
      sha256 "d449f5f375bd4e670307d869c85400b376b357b2159f0f2a6072869f249f50e7"
    end
    on_intel do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.2/relay-0.2.2-darwin-x64.tar.gz"
      sha256 "c43c8a6f197fa5f87800aa5126a3b98a73e8a741880ef706b83ae90af83425de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.2/relay-0.2.2-linux-arm64.tar.gz"
      sha256 "865473ae415068d0056cb2c201c30511ae5f674ca0d5d96243190c20f66842cf"
    end
    on_intel do
      url "https://github.com/ffgenius/relay/releases/download/v0.2.2/relay-0.2.2-linux-x64.tar.gz"
      sha256 "cda672545804ff7bfd59ed97dfc310ef10bc8826453ff5168047e13a50f33306"
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
