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
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.3.0/pst-aarch64-apple-darwin.tar.gz"
      sha256 "63942bc89535b4715d161ff5e4b5f99e57ef7da4797218c350e1a512558b1bba"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.3.0/pst-x86_64-apple-darwin.tar.gz"
      sha256 "d4625ddae520078b5f91b0858408e9c411bb2be059252448253ebfe86c2b6018"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.3.0/pst-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d29498ca1488a00c6e22820fdf0ee199d9d3c51277c5a911968000a5f308bd06"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.3.0/pst-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a66faa9761f1a4beb5e081f4df0663e431385f6ff126b415b104963a5cadc574"
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
