#!/usr/bin/env ruby

git_bundles = [
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/tpope/vim-rails.git",
  "https://github.com/tpope/vim-repeat.git",
  "https://github.com/tpope/vim-surround.git",
	"https://github.com/mileszs/ack.vim.git",
	"https://github.com/tpope/vim-commentary.git",
	"https://github.com/itspriddle/vim-stripper.git",
	"https://github.com/xolox/vim-misc", #required by easytags below
	"https://github.com/xolox/vim-easytags",
	"https://github.com/tpope/vim-endwise",
  "https://github.com/wincent/Command-T.git"
]

vim_org_scripts = [
  ["IndexedSearch", "7062",  "plugin"],
  ["jquery",        "12107", "syntax"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end
