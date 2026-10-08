class Zoorikctl < Formula
  desc "Connect a Kubernetes cluster to Zoorik"
  homepage "https://zoorik.com"
  version "v0.4.2"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.2/zoorikctl_v0.4.2_darwin_arm64.tar.gz"
      sha256 "e6071d86351d43a690568d0b700df5c9b07de4d6f742fd18d603be17be2dde8a"
    end
    on_intel do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.2/zoorikctl_v0.4.2_darwin_amd64.tar.gz"
      sha256 "6b5718675e3735faba3f1e489f7041ab61424fd32c5a200001a234dbe64669fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.2/zoorikctl_v0.4.2_linux_arm64.tar.gz"
      sha256 "ab2576837eed105aa9b20f3a2cd655d9e9efd8ccf25ef66d46566cf1a5daad56"
    end
    on_intel do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.2/zoorikctl_v0.4.2_linux_amd64.tar.gz"
      sha256 "f01ccf1b9199d3a8adb978f1d51c141848b3349770507fb6ce6f85451fa2ec04"
    end
  end

  def install
    bin.install "zoorikctl"
  end

  test do
    assert_match "zoorikctl", shell_output("#{bin}/zoorikctl version")
  end
end
