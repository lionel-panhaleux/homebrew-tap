# GENERATED FILE — do not edit in the tap.
# Source of truth: .github/homebrew/pst.rb.tmpl in the pst repo, rendered by
# .github/workflows/release.yml on each tagged release.
#
# Installs a prebuilt binary (no Rust/LLVM toolchain). Use `--HEAD` to build from source.
class Pst < Formula
  desc "Git-friendly, one-line-per-ticket work tracker for AI agents"
  homepage "https://github.com/lionel-panhaleux/pst"
  license "MIT"

  head do
    url "https://github.com/lionel-panhaleux/pst.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.4.1/pst-aarch64-apple-darwin.tar.gz"
      sha256 "7e5041cb9e028f0007e9516d750ff22d1f16a2d17e81caf5b9bd3e5b95c9e853"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.4.1/pst-x86_64-apple-darwin.tar.gz"
      sha256 "68e7bdf7d66a518ab1fb60aa361cca18ae1419248b1fe870b5276fdd9fc2e790"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.4.1/pst-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa53a99ddc165ed340c9441ebbd7eac624be0ab57552111fe1cbe76b09049876"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.4.1/pst-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d9f88c212354ad3b69cb8ac263e46f5b12ee7e94f69f6d28d315c18e2d8190e"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "pst"
    end
  end

  test do
    assert_match "plain-simple-tickets", shell_output("#{bin}/pst --help")
  end
end
