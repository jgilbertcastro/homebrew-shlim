class Shlim < Formula
  desc "Persistent, token-lean shell for AI coding agents, over MCP"
  homepage "https://github.com/jgilbertcastro/shlim"
  version "0.0.2-rc1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.2-rc1/shlim-aarch64-apple-darwin.tar.gz"
      sha256 "6bc77a6aa7b36e4ea3cd59a344586a079fd072e19cca7bc988d2462dc6487d13"
    end
    on_intel do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.2-rc1/shlim-x86_64-apple-darwin.tar.gz"
      sha256 "99b987cb51d00886ffec1947fb0957f35db1b4b696a4825f82dba4e8d7855676"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.2-rc1/shlim-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b000785be60c2acdbbde0e08d9acdeedd88feb924202564923fcea568874602c"
    end
    on_intel do
      url "https://github.com/jgilbertcastro/shlim/releases/download/v0.0.2-rc1/shlim-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5bba0abeaf544baedb599aaf6b1bc2189ff42c2634ae6b7fb2193c73afd51cad"
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
