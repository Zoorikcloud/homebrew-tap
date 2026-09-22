class Zoorikctl < Formula
  desc "Connect a Kubernetes cluster to Zoorik"
  homepage "https://zoorik.com"
  version "v0.2.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.2.0/zoorikctl_v0.2.0_darwin_arm64.tar.gz"
      sha256 "40d9f3b433ef65f5c3299a77b3c1977c97703958dd453928c5109fd3a59a268b"
    end
    on_intel do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.2.0/zoorikctl_v0.2.0_darwin_amd64.tar.gz"
      sha256 "e2df58928771df1c34a5cf1d740090707ecab2dc6afc277fd48dbf87b6566b59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.2.0/zoorikctl_v0.2.0_linux_arm64.tar.gz"
      sha256 "0023c3972df9d4e82a15f2283e120e886a8b27bb4ff425cda1048bd959eec7ab"
    end
    on_intel do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.2.0/zoorikctl_v0.2.0_linux_amd64.tar.gz"
      sha256 "054087c7ab1f510d11b130dab4d2d1a424b0bbedbda3bf29211eecf2db29f001"
    end
  end

  def install
    bin.install "zoorikctl"
  end

  test do
    assert_match "zoorikctl", shell_output("#{bin}/zoorikctl version")
  end
end
