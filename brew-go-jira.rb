class GoJira < Formula
  desc "go-jira - simple jira command line client in Go" if respond_to? :desc
  homepage "https://github.com/Netflix-Skunkworks/go-jira"

  # curl -L -o hoge https://github.com/Netflix-Skunkworks/go-jira/releases/download/0.0.16/jira-darwin-38 && chmod +x hoge && ./hoge -h
  url "https://github.com/Netflix-Skunkworks/go-jira/releases/download/0.0.16/jira-darwin-386"

  # shasum -a 256 thefile
  sha256 "2d7aebbda271124dc8844929713ac531608b9a7c6ff008000c1322e806a94e21"

  # See https://github.com/Netflix-Skunkworks/go-jira/releases
  version "0.0.16"

  def install
    bin.install "jira-darwin-386" => "jira"
  end

  def caveats; <<-EOS.undent
    You will need to specify your local jira endpoint first, typically in your homedir like:

      mkdir ~/.jira.d

      cat <<EOM >~/.jira.d/config.yml
      endpoint: https://jira.mycompany.com
      EOM

    If you are working on a "foo" project, create a configuration under your project workspace at ./.jira.d/config.yml that looks like:

      project: foo
    EOS
  end

  test do
    shell_output("eval \"$(#{bin}/anyenv init -)\" && anyenv version")
  end
end
