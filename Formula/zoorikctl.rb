# Homebrew formula for zoorikctl, rendered per release by cli/zoorikctl/packaging/render.sh and pushed
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
class Zoorikctl < Formula
  desc "Connect a Kubernetes cluster to Zoorik"
  homepage "https://zoorik.com"
  version "v0.1.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/storagetax/zoorikctl/releases/download/v0.1.1/zoorikctl_v0.1.1_darwin_arm64.tar.gz"
      sha256 "8e7f609f3e9c06ded5ede3e6077f695cd83825ad1316958a40a5216f0f46b44f"
    end
    on_intel do
      url "https://github.com/storagetax/zoorikctl/releases/download/v0.1.1/zoorikctl_v0.1.1_darwin_amd64.tar.gz"
      sha256 "65666c2ddc4d094f18213e200e6b2763ea763323e8a2dd9d7032654c0bd6f17c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/storagetax/zoorikctl/releases/download/v0.1.1/zoorikctl_v0.1.1_linux_arm64.tar.gz"
      sha256 "7589b1f981bde77767c9c0cdddf692205916f7ae75672b1489a57154a51c96f8"
    end
    on_intel do
      url "https://github.com/storagetax/zoorikctl/releases/download/v0.1.1/zoorikctl_v0.1.1_linux_amd64.tar.gz"
      sha256 "0e09d62e6fbcb9d909be42b79a3ecbb838c0de2a591e2789d66564b7f723b22f"
    end
  end

  def install
    bin.install "zoorikctl"
  end

  # `brew test` runs this. It deliberately does not connect anything: the one thing worth proving
  # after an install is that the binary this platform got actually executes here, which is exactly
  # what a wrong-architecture or a Gatekeeper-blocked download fails.
  test do
    assert_match "zoorikctl", shell_output("#{bin}/zoorikctl version")
  end
end
