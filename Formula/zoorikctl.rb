class Zoorikctl < Formula
  desc "Connect a Kubernetes cluster to Zoorik"
  homepage "https://zoorik.com"
  version "v0.4.3"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.3/zoorikctl_v0.4.3_darwin_arm64.tar.gz"
      sha256 "6db863d475f86c6e9e173de38062d200d92c0f2202faa26eaeb3c48e48a81c39"
    end
    on_intel do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.3/zoorikctl_v0.4.3_darwin_amd64.tar.gz"
      sha256 "a7244babce361777ea0fd250aa4a3fb6aee9815d8073d1e2ea2a9936b833fe16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.3/zoorikctl_v0.4.3_linux_arm64.tar.gz"
      sha256 "1796f0726740fb41e06e0852f01b0f1190d6a0aeed5a17a872c6bd87f9c8c734"
    end
    on_intel do
      url "https://github.com/getzoorik/zoorikctl/releases/download/v0.4.3/zoorikctl_v0.4.3_linux_amd64.tar.gz"
      sha256 "6035b824bbf850469eaff13dee396e935d2997aef193de499b127386abcde427"
    end
  end

  def install
    bin.install "zoorikctl"
  end

  test do
    assert_match "zoorikctl", shell_output("#{bin}/zoorikctl version")
  end
end
