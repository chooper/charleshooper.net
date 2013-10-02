#!/usr/bin/env ruby

# Crawls given dir looking for *.(md|markdown) files that contain invalid unicode

raise "Usage: #{$0} <dir>" if ARGV[0].nil?

target_globs = [
  File.join(ARGV[0], "**", "*.yml"),
  File.join(ARGV[0], "**", "*.htm"),
  File.join(ARGV[0], "**", "*.html"),
  File.join(ARGV[0], "**", "*.md"),
  File.join(ARGV[0], "**", "*.markdown") ]

target_globs.each do |target_glob|
  Dir.glob(target_glob).each do |f|
    puts "not a file! #{f}" unless File.file?(f)

    contents = open(f, 'rb').read
    contents.encode!("UTF-8", "binary", :undef => :replace)
    open(f, 'w').write(contents)
  end
end

