# The Homebrew formula for pjman, written by the release (scripts/release.mjs) into the tap vinhvanvu/homebrew-pjman as
# Formula/pjman.rb after each publish, from the package the release put on npm. Never edited by hand: the next release
# overwrites it. 0.8.0 and 5a0d0f93ba77f6b9d5705b7d853249586e1a6cb6448d8881e71f25a0b67bdf7a are filled in by the release.
class Pjman < Formula
  desc "Context graph for product development: changes, decisions, the product tree and agent sessions in git"
  homepage "https://github.com/vinhvanvu/pjman"
  url "https://registry.npmjs.org/@vinhvanvu/pjman/-/pjman-0.8.0.tgz"
  sha256 "5a0d0f93ba77f6b9d5705b7d853249586e1a6cb6448d8881e71f25a0b67bdf7a"
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
