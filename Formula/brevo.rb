require "language/node"

class Brevo < Formula
  desc "Developer CLI — create, manage apps and OAuth integrations"
  homepage "https://developers.brevo.com/docs/cli-reference"
  url "https://registry.npmjs.org/@getbrevo/cli/-/cli-2.3.0.tgz"
  sha256 "bc46e5297d9ed0f364f70a1e799cb3f3ea2d66b9dea358f370dc41c370cbd932"
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
