class Shlim < Formula
  desc "Persistent, token-lean shell for AI coding agents, over MCP"
  homepage "https://github.com/jgilbertcastro/shlim"
  version "0.0.3-rc1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.3-rc1/shlim-aarch64-apple-darwin.tar.gz"
      sha256 "0e5de883e9545bf77cf88954597bba6b8c04cb1e7d265ee00112961df340a174"
    end
    on_intel do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.3-rc1/shlim-x86_64-apple-darwin.tar.gz"
      sha256 "7346bef7d9fec499de7b3de9922194a8bd2c31d749e9123afc4a09983dd6f318"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.3-rc1/shlim-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d2872fd463482111da33687ad2138ba3495e5c1596b48ea2714daa50dfb96a25"
    end
    on_intel do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.3-rc1/shlim-x86_64-unknown-linux-musl.tar.gz"
      sha256 "45898a9dd527a24cbdb00fbbdf5556dfc7be927b734bd4b54fb86ff843302f0d"
    end
  end

  def install
    bin.install "shlim"
  end

  def caveats
    <<~EOS
      Connect your agent, then restart it:
        shlim install claude
        shlim install codex
      After an upgrade, run `shlim stop` so the daemon restarts on the new version.
    EOS
  end

  test do
    ENV["SHLIM_HOME"] = "/tmp/shlim-brew-#{Process.pid}"
    assert_match "hello", shell_output("#{bin}/shlim run 'echo hello'")
  ensure
    system bin/"shlim", "stop"
  end
end
