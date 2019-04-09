class ReattachToSessionNamespace < Formula
  desc "PAM that reattaches to the user's Aqua session on macOS, for TouchID support in tmux"
  homepage "https://github.com/fabianishere/pam_reattach"
  url "https://github.com/fabianishere/pam_reattach/archive/v1.2.tar.gz"
  sha256 "60133388c400a924ca05ee0e5e6f9cc74c9f619bf97e545afe96f35544b0d011"
  head "https://github.com/fabianishere/pam_reattach.git"

  depends_on "cmake" => :build

  def install
    mkdir "build"
    cd "build" do
      system "cmake", "../", *std_cmake_args
      system "make"
      #bin.install "reattach-to-user-namespace"
      system "make", "install"
    end
  end

  test do
  #  system bin/"reattach-to-user-namespace", "-l", "bash", "-c", "echo Hello World!"
  end
end
