class ScIm < Formula
  desc "SC-IM - Spreadsheet Calculator Improvised -- An ncurses spreadsheet program for terminal (with experimental md support)"
  homepage "https://github.com/andmarti1424/sc-im"
  url "https://github.com/andmarti1424/sc-im/archive/v0.7.0.tar.gz"
  sha256 "5da644d380ab3752de283b83cce18c3ba12b068d0762c44193c34367a0dcbc38"
  head "https://github.com/mipmip/sc-im.git", :branch => "mdexport"
  revision 3

  def install
    Dir.chdir("src") do
      system "make", "prefix=#{prefix}"
      system "make", "prefix=#{prefix}", "install"
    end
  end

  test do
    input = <<~EOS
      let A1=1+1
      getnum A1
    EOS

    cmd = %W(#{bin}/scim --nocurses --quit_afterload 2>/dev/null | tail -n 1)

    assert_equal "nowide 2", pipe_output(cmd, input).lines.last.chomp
  end
end
