class Zoorikctl < Formula
  desc "Connect a Kubernetes cluster to Zoorik"
  homepage "https://zoorik.com"
  version "v0.3.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.3.1/zoorikctl_v0.3.1_darwin_arm64.tar.gz"
      sha256 "6d45194b179061dacc64e6cf3bf60c71971a3995bf469b22b7c69ac8fdc0e3b9"
    end
    on_intel do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.3.1/zoorikctl_v0.3.1_darwin_amd64.tar.gz"
      sha256 "850c4f2ad5a9f3bffb757869f4f8e43f36405148ae2f2ec6080665179496a41a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.3.1/zoorikctl_v0.3.1_linux_arm64.tar.gz"
      sha256 "8c43039c624fe429f8114fa39a18cc72b041ccb5ca4a352182f0a92fc34d3e6b"
    end
    on_intel do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.3.1/zoorikctl_v0.3.1_linux_amd64.tar.gz"
      sha256 "b8639d3a4703f38e74f2126c9b57aa1193a14a309eb42aba867ced0ec027d8c3"
    end
  end

  def install
    bin.install "zoorikctl"
  end

  test do
    assert_match "zoorikctl", shell_output("#{bin}/zoorikctl version")
  end
end
