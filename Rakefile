require 'json'
require_relative 'rblib/sbt'
require_relative 'rblib/spark'

######################## 配置 ##########################################
#脚本读取的配置文件
cfg_file = "spark.json"

#jar包存放的远程目录
rt_dir = "~"
########################################################################

if !File.exist?(cfg_file)
  puts "config file spark.json doesn't exist"
  exit
end

sbt = Sbt.new
spark = Spark.new(cfg_file)
if rt_dir == "~"
  rt_dir = spark.home
elsif !rt_dir.start_with?("/")
  rt_dir = spark.home + rt_dir
end

####################### 任务 ###########################################

desc "默认推送Jar包并执行spark-submit"
task default: %w[submit]

desc "将jar包推送到远程主机上"
task :push do
  system("scp #{sbt.output_dir}/#{sbt.assembly_jar} #{spark.ssh_arg}:#{rt_dir}")
end

desc "将jar包从远程主机删除"
task :clean do
  system("ssh #{spark.ssh_arg} rm #{rt_dir}/#{sbt.assembly_jar}")
end

desc "在远程主机执行spark-submit"
task submit: [:push] do
  system("ssh #{spark.ssh_arg} #{spark.submit} #{spark.submit_args} #{rt_dir}/#{sbt.assembly_jar}")
end
########################################################################
