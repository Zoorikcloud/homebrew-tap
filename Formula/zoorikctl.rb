class Zoorikctl < Formula
  desc "Connect a Kubernetes cluster to Zoorik"
  homepage "https://zoorik.com"
  version "v0.3.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.3.0/zoorikctl_v0.3.0_darwin_arm64.tar.gz"
      sha256 "946f58ed803489da943706e475192c7db4262312c171b2d19467fd12242f9933"
    end
    on_intel do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.3.0/zoorikctl_v0.3.0_darwin_amd64.tar.gz"
      sha256 "32a3232ecdcc86e72cc9f3c4c29b690d84baffb3196d88b5665ad2b92ff1b732"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.3.0/zoorikctl_v0.3.0_linux_arm64.tar.gz"
      sha256 "a6e57a8bff4f1fe867bbc15fdd4b7ffa9de47f9924b08348bbbfd3786778fa38"
    end
    on_intel do
      url "https://github.com/Zoorikcloud/zoorikctl/releases/download/v0.3.0/zoorikctl_v0.3.0_linux_amd64.tar.gz"
      sha256 "1b9d733799c91a5018401a86a2c512d37db83a857bb3c1205ac676446e7c57c9"
    end
  end

  def install
    bin.install "zoorikctl"
  end

  test do
    assert_match "zoorikctl", shell_output("#{bin}/zoorikctl version")
  end
end
