class Amcl < Formula
  desc "A standards compliant C cryptographic library with no external dependencies, specifically designed to support the Internet of Things (IoT)."
  homepage "https://github.com/xaptum/amcl"
  version "4.7.3"
  url "https://github.com/xaptum/amcl/archive/4.7.3.tar.gz"
  sha256 "d32c3a10f04db797c6ad863ecac998228ff281b482b4daa936ff80b0e824396c"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args,
             "-DAMCL_INCLUDE_SUBDIR=amcl",
             "-DBUILD_BENCHMARKS=OFF",
             "-DBUILD_DOCS=OFF",
             "-DBUILD_EXAMPLES=OFF",
             "-DBUILD_PYTHON=OFF",
             "-DBUILD_TESTING=OFF"
      system "make"
      system "make", "install"
    end
  end

end
