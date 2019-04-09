class ReattachToSessionNamespace < Formula
  desc "PAM reattaches UI session for TID support in tmux"
  homepage "https://github.com/fabianishere/pam_reattach"
  url "https://github.com/fabianishere/pam_reattach/archive/v1.2.tar.gz"
  sha256 "60133388c400a924ca05ee0e5e6f9cc74c9f619bf97e545afe96f35544b0d011"
  head "https://github.com/fabianishere/pam_reattach.git"

  depends_on "cmake" => :build

  def install
    args = %w[
      -DENABLE_CLI=ON
    ]
    mkdir "build"
    cd "build" do
      system "cmake", "../", *std_cmake_args, *args
      system "make"
      system "make", "install"
    end
  end

  test do
    system bin/"reattach-to-session-namespace", "echo Hello World!"
  end
end
