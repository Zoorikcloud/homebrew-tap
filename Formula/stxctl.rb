# Homebrew formula for stxctl, rendered per release by cli/stxctl/packaging/render.sh and pushed
# to the storagetax/homebrew-tap repository.
#
# A FORMULA AND NOT A CASK, which is the one packaging decision here worth writing down.
#
# Cast AI ships a cask, and the tell is in their own instructions: `brew trust --cask
# castai/tap/castctl` before `brew install`. That extra line exists because a cask installs an
# artifact Homebrew treats as third-party software and asks the user to vouch for. A formula that
# installs a prebuilt binary needs no such step, and every line a customer has to paste is a line
# an onboarding can die on.
#
# The second reason is Linux. `on_linux` costs three lines in a formula and gives Homebrew-on-Linux
# for free -- which is worth having, because Homebrew is common on developer Linux machines and on
# CI images, and the alternative for those users is a `curl | sh` they may not be allowed to run.
# Casks are macOS-only, so choosing one would have made that a separate packaging problem.
#
# 🔴 SHA256 IS THE CHECKSUM CHECK ON THIS PATH. Homebrew verifies it before unpacking, and refuses
# on a mismatch, which is why the Homebrew tab is the only install path here that needs no
# verification logic of our own.
class Stxctl < Formula
  desc "Connect a Kubernetes cluster to Storagetax"
  homepage "https://storagetax.com"
  version "v0.0.1-rc1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/storagetax/stxctl/releases/download/v0.0.1-rc1/stxctl_v0.0.1-rc1_darwin_arm64.tar.gz"
      sha256 "5a3b119cec9cae6783bd3ef5195b5624c7243a538fdaac653ef98df1f4fa156d"
    end
    on_intel do
      url "https://github.com/storagetax/stxctl/releases/download/v0.0.1-rc1/stxctl_v0.0.1-rc1_darwin_amd64.tar.gz"
      sha256 "f53237c34641b3fa9b5217a316a5a5a9f4f6f08fe320a9a05b52bb7c5d1b5938"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/storagetax/stxctl/releases/download/v0.0.1-rc1/stxctl_v0.0.1-rc1_linux_arm64.tar.gz"
      sha256 "7d37477cc5f637e46c12b8ec8fcc2c1670c95a33f4dc776687f3bc4101893fc2"
    end
    on_intel do
      url "https://github.com/storagetax/stxctl/releases/download/v0.0.1-rc1/stxctl_v0.0.1-rc1_linux_amd64.tar.gz"
      sha256 "88bce481641307f4e92eedab05598d58ddd6bfa271cfbe47af70fb03753859e1"
    end
  end

  def install
    bin.install "stxctl"
  end

  # `brew test` runs this. It deliberately does not connect anything: the one thing worth proving
  # after an install is that the binary this platform got actually executes here, which is exactly
  # what a wrong-architecture or a Gatekeeper-blocked download fails.
  test do
    assert_match "stxctl", shell_output("#{bin}/stxctl version")
  end
end
