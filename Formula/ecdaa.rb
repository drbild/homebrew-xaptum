class Ecdaa < Formula
  desc "A C implementation of elliptic-curve-based Direct Anonymous Attestation (DAA) signatures."
  homepage "https://github.com/xaptum/ecdaa"
  version "0.8.3"
  url "https://github.com/xaptum/ecdaa/archive/v0.8.3.tar.gz"
  sha256 "6cbac430196a2982f82d9bce9f137dba415bbc7855c9181b4b8852e181422943"

  depends_on "cmake" => :build
  depends_on "python" => :build
  depends_on "amcl"
  depends_on "libsodium" => :recommended
  depends_on "xaptum-tpm" => :recommended

  def install
    args = std_cmake_args
    args << "-DECDAA_CURVES=BN254,BN254CX,BLS383,FP256BN"
    args << "-DBUILD_EXAMPLES=OFF"
    args << "-DBUILD_TESTING=OFF"

    if build.without? "xaptum-tpm"
      args << "-DECDAA_TPM_SUPPORT=OFF"
    else
      args << "-DECDAA_TPM_SUPPORT=ON"
    end

    if build.without? "libsodium"
      args << "-DDISABLE_LIBSODIUM_RNG_SEED_FUNCTION=ON"
    end

    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *args
      system "make"
      system "make", "install"
    end
  end

end
