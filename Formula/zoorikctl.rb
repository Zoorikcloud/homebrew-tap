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
class Stxctl < Formula
  desc "Connect a Kubernetes cluster to Storagetax"
  homepage "https://zoorik.com"
  version "v0.1.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/storagetax/zoorikctl/releases/download/v0.1.0/zoorikctl_v0.1.0_darwin_arm64.tar.gz"
      sha256 "5d55134b684114a34672a985b65605b69555bae4b054dca968bfeb8bb1de1fd5"
    end
    on_intel do
      url "https://github.com/storagetax/zoorikctl/releases/download/v0.1.0/zoorikctl_v0.1.0_darwin_amd64.tar.gz"
      sha256 "5d178e9ced7ce2b649f4ad1ba90e4e3d7683c6156fed0168cac4ce7e76a6777f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/storagetax/zoorikctl/releases/download/v0.1.0/zoorikctl_v0.1.0_linux_arm64.tar.gz"
      sha256 "26c43bc97b72c0c6cc3f30e09cf810839be018c4502e0f099be88bcf2be67e05"
    end
    on_intel do
      url "https://github.com/storagetax/zoorikctl/releases/download/v0.1.0/zoorikctl_v0.1.0_linux_amd64.tar.gz"
      sha256 "4ae3cccb47ee0e49816f4dfdc9669d728a52d3ce875dbcb1c9b99b9fd09b4ce6"
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
