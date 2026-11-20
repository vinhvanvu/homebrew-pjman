# The Homebrew formula for pjman, written by the release (scripts/release.mjs) into the tap vinhvanvu/homebrew-pjman as
# Formula/pjman.rb after each publish, from the package the release put on npm. Never edited by hand: the next release
# overwrites it. 0.7.0 and 7328a9a785975fbc535d3495cd35ca231ec810b645588590ba2203efde2b1031 are filled in by the release.
class Pjman < Formula
  desc "Context graph for product development: changes, decisions, the product tree and agent sessions in git"
  homepage "https://github.com/vinhvanvu/pjman"
  url "https://registry.npmjs.org/@vinhvanvu/pjman/-/pjman-0.7.0.tgz"
  sha256 "7328a9a785975fbc535d3495cd35ca231ec810b645588590ba2203efde2b1031"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      Run `pjman init` in a repository to set it up and install the Claude Code plugin.
      After `brew upgrade pjman` the plugin refreshes itself at the next Claude Code session;
      run `pjman migrate` when pjman asks for it.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pjman --version")
  end
end
