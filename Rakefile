require 'rubygems'
require 'rake'
require 'rake/testtask'

begin
  require "shoulda/tasks"
rescue LoadError
  puts "[!] Please install the shoulda gem for listing specification in tests ($ sudo gem install shoulda)"
end

begin
  require 'term/ansicolor'
  class String
    include Term::ANSIColor
  end
rescue LoadError
  class String
    def black; self; end
    def on_green; self; end
    def on_yellow; self; end
  end
end
  
task :default => :test

desc "Start the tutorial (checkout step branches and switch to step one)"
task :start do
  puts "[!] You need Git installed to step through the code history" and abort(1) if `which git`.chomp == ''
  `git fetch`
  GitSteps::checkout_step_branches
  puts "-------------------------------------"
  puts ">>> " + "Starting the tutorial with step 1".black.on_green
  puts "-------------------------------------"
  branch = GitSteps::first_branch
  GitSteps::switch_to( branch )
  puts GitSteps::branch_info(branch)
  puts "\n"
end

desc "Step to the next step of tutorial"
task :step do
  puts "[!] You need Git installed to step through the code history" and abort(1) if `which git`.chomp == ''
  GitSteps::next_branch
end

desc "Switch to master branch"
task :master do
  puts ">>> Switching you back to master"
  GitSteps::switch_to('master')
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
  t.warning = true
end

module GitSteps
  def self.branches
    %x[git branch --no-color].split("\n").map { |b| strip_junk(b) }.sort
  end
  def self.current_branch
    if b = %x[git branch --no-color].split("\n").select { |b| b =~ /^\*/ }.first
      strip_junk(b)
    else
      raise "Currently not on any branch"
    end
  end
  def self.first_branch
    branches.select { |b| b =~ /^step/ }.first 
  end
  def self.next_branch
    i = branches.index(current_branch)
    if branches.at(i+1)
      id = `git show --pretty="%h" --no-color #{branches.at(i+1)}`.split("\n").first
      puts "-------------------------------------"
      puts ">>> Switching you to " + "step #{i+1}".black.on_yellow + " [#{id}]"
      puts "-------------------------------------"
      puts branch_info( branches.at(i+1) )
      puts "\n"
      switch_to( branches.at(i+1) )
    else
      puts "-------------------------------------"
      puts ">>> Switching you to " + first_branch.black.on_green + " [#{`git show --pretty='%h' --no-color #{first_branch}`.split("\n").first}]"
      puts "-------------------------------------"
      puts branch_info( first_branch )
      puts "\n"
      switch_to( first_branch )
    end
  end
  def self.switch_to(branch)
    raise "[!] Branch '#{branch}' does not exist" unless branches.include?(branch)
    %x[git checkout --quiet #{branch}]
    raise "[!] Error while checking out branch '#{branch}'" unless $?.success?
  end
  def self.checkout_step_branches
    step_branches = `git branch -r --no-color`.split("\n").select { |b| b =~ /step_/ }.
                                                           map { |b| strip_junk(b) }.
                                                           sort
    step_branches.each do |remote_name|
      local_name = remote_name.split("/").last
      `git branch #{local_name} #{remote_name}` unless branches.include?(local_name)
    end
  end
  def self.branch_info(branch)
    `git show --format="%s%n%b" #{branch}`.split(/diff --git/).first.chomp
  end
  private
  def self.strip_junk(b)
    b.to_s.gsub(/\*|\s/, '')
  end
end
