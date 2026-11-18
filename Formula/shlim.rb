class Shlim < Formula
  desc "Persistent, token-lean shell for AI coding agents, over MCP"
  homepage "https://github.com/jgilbertcastro/shlim"
  version "0.0.1-rc1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.1-rc1/shlim-aarch64-apple-darwin.tar.gz"
      sha256 "877394ec594413eba45d6b9e02c28c5455debc1d49311fc692d75f8ead316f71"
    end
    on_intel do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.1-rc1/shlim-x86_64-apple-darwin.tar.gz"
      sha256 "c36ead1e1d77e729bfbd26b6983fa155bc79d8f6f452cd84937fb48ac18a3ca4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.1-rc1/shlim-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8ffac9c918f58ec90da787ba3593340764b2c49823e951dcfff90d8f0c63a9bc"
    end
    on_intel do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.1-rc1/shlim-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b936060875d62bf7364b18c97055fb9328a879e3f17162ef3d49865fab651853"
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
