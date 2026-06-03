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
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.4.0/pst-aarch64-apple-darwin.tar.gz"
      sha256 "e36be4e1f9b180a68c8be93cb0d6e533f8347a7678580b76142cb8aba525a8da"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.4.0/pst-x86_64-apple-darwin.tar.gz"
      sha256 "a00cc9470b085331d49ed423078cef4a6c3bad72ce2fb0bb4044bd9efb8cf5bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.4.0/pst-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26e340dacea94ba30590a6c4f315d6a08360ab9000cb62419b2c35172e209c5c"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.4.0/pst-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18377ead7da486e14cb03868db45d919fc17f1c9b64a109440cfa10fb8aa8714"
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
