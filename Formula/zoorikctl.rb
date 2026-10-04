class Zoorikctl < Formula
  desc "Connect a Kubernetes cluster to Zoorik"
  homepage "https://zoorik.com"
  version "v0.4.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.4.0/zoorikctl_v0.4.0_darwin_arm64.tar.gz"
      sha256 "23cf457979e6c04394d8d892b272e410b750af18a28ecdbc44b367d3efdec182"
    end
    on_intel do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.4.0/zoorikctl_v0.4.0_darwin_amd64.tar.gz"
      sha256 "84bc5275b857d7958f0ec29779487b6f56668ea7299d3dc09fc84bbeee5d7b94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.4.0/zoorikctl_v0.4.0_linux_arm64.tar.gz"
      sha256 "4215a86d9db5644d58c69ce7efbee3bfb0fe81f6daa2f19a3b58c05738d2a916"
    end
    on_intel do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.4.0/zoorikctl_v0.4.0_linux_amd64.tar.gz"
      sha256 "ad5d5aa1b81e1bc514b211b772168ef9f203f221502173841362bb2f5329afbf"
    end
  end

  def install
    bin.install "zoorikctl"
  end

  test do
    assert_match "zoorikctl", shell_output("#{bin}/zoorikctl version")
  end
end
