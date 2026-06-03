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
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.3.1/pst-aarch64-apple-darwin.tar.gz"
      sha256 "903f824c49861baf603f7672341c6e9d25b7d72993b85c18f3b0f24960948110"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.3.1/pst-x86_64-apple-darwin.tar.gz"
      sha256 "b1c96b6e1d21329974e601fb5bff887cb1add3ee668da22646a5e856823f1267"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.3.1/pst-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d07e288c6c5be5af6069efcb561b654c848ce0a5c3a5461682a91e4d73f4168"
    end
    on_intel do
      url "https://github.com/lionel-panhaleux/pst/releases/download/v0.3.1/pst-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cba06cdfb590f83f837c733b4b29fdff0fb74153c18fad3a247b7ab0ef5d7cb3"
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
