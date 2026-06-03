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
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.2.0/pst-aarch64-apple-darwin.tar.gz"
      sha256 "c4d5199d10f6cf93cfdef320fa00c24c0760e003c860a4cb2168f8b7cd8305b0"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.2.0/pst-x86_64-apple-darwin.tar.gz"
      sha256 "13b6c9ab619b5258e4b8f535755a8bab3aec6031168de0ed671021828559cf83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.2.0/pst-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e25a2382aef7196503a1b3ada8320db63d4cd278d96d7c20d91ed6e065c90b55"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.2.0/pst-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9dffa374e951d96623d69013ae5f88f66ca418a0fa49f8868d95655ecdfab672"
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
