class Zoorikctl < Formula
  desc "Connect a Kubernetes cluster to Zoorik"
  homepage "https://zoorik.com"
  version "v0.4.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.1/zoorikctl_v0.4.1_darwin_arm64.tar.gz"
      sha256 "2f6622909270a0e4cc215dc60dada14e517c937bc8cc2cc31c03ded4a11a368f"
    end
    on_intel do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.1/zoorikctl_v0.4.1_darwin_amd64.tar.gz"
      sha256 "092c263790ec9328197a3cf335c77db41fcc63f04c1746dbcbd1df336458dce6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.1/zoorikctl_v0.4.1_linux_arm64.tar.gz"
      sha256 "50647556ef9cab950f5db386f7d918c7619185fea126edd3bb4e9e8dc9fd3596"
    end
    on_intel do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.1/zoorikctl_v0.4.1_linux_amd64.tar.gz"
      sha256 "dcb063fe78c69b019ea06d57c6cd64f671da90b9b85c05676d279955c9e3e8a2"
    end
  end

  def install
    bin.install "zoorikctl"
  end

  test do
    assert_match "zoorikctl", shell_output("#{bin}/zoorikctl version")
  end
end
