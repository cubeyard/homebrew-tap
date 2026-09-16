class Cube < Formula
  desc "Self-hosted coding-agent sandboxes on a VM you own"
  homepage "https://github.com/cubeyard/cube"
  url "https://github.com/cubeyard/cube/releases/download/v0.1.26/cube"
  sha256 "e194f5824b58e78193446b51a4bb9609d2ec8ab1e0b817274f0da23e5639b4c1"
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
