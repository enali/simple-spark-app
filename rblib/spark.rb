class Spark
  attr_reader :ssh_arg, :spark_dir, :submit, :submit_args, :home
  def initialize(cfg_file="spark.json")
    cfg = JSON.parse(open(cfg_file).read)
    @ssh_arg = "#{cfg["server"]["username"]}@#{cfg["server"]["host"]}"
    @spark_dir = "#{cfg["spark"]["basedir"]}/spark-#{cfg["spark"]["version"]}-bin-hadoop#{cfg["spark"]["hadoop-version"]}"
    @submit = "#{@spark_dir}/bin/spark-submit"
    @submit_args = cfg["submit"].map{|k,v| "--#{k} #{v}"}.join(" ")
    @home = "/home/#{cfg["server"]["username"]}"
  end
end
