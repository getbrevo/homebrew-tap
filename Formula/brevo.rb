require "language/node"

class Brevo < Formula
  desc "Developer CLI — create, manage apps and OAuth integrations"
  homepage "https://developers.brevo.com/docs/cli-reference"
  url "https://registry.npmjs.org/@getbrevo/cli/-/cli-2.2.1.tgz"
  sha256 "a0e093ffaab6b1556a8edd3f537df07a5d186a8ab6672dcdf2291d9e8c5843b6"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/brevo --version")
  end
end
