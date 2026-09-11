class Cube < Formula
  desc "Self-hosted coding-agent sandboxes on a VM you own"
  homepage "https://github.com/cubeyard/cube"
  url "https://github.com/cubeyard/cube/releases/download/v0.1.18/cube"
  sha256 "3c0c00c6fd961e34c083b999a2bb98b6c6219f6890cbd7b72215a7721430f068"
  license "Apache-2.0"

  depends_on :macos
  depends_on "qemu"

  def install
    inreplace "cube", "INSTALL_METHOD=standalone", "INSTALL_METHOD=homebrew"
    bin.install "cube"
  end

  def caveats
    <<~EOS
      Run cube up to download and start the VM (~1.1 GB on first use).
      brew upgrade cube updates the launcher; cube upgrade updates the VM.
      VM data lives in ~/.cube and is kept when this formula is uninstalled.
      To delete it, explicitly run cube destroy --yes before uninstalling.
    EOS
  end

  test do
    ENV["CUBE_HOME"] = testpath/"state"
    ENV["CUBE_BIND"] = "127.0.0.1"
    assert_match "cube up", shell_output("#{bin}/cube help")
    assert_match "none installed", shell_output("#{bin}/cube version")
    assert_predicate testpath/"state", :directory?
  end
end
