class Sbt
  attr_reader :base_dir, :sbt_args, :assembly_jar, :package_jar, :output_dir

  def initialize
    @base_dir = Dir.pwd
    @sbt_args = sbt_args
    @output_dir = "target/scala-#{@sbt_args[:scalaVersion].sub(/\.\d+$/, '')}"
    @assembly_jar = "#{@sbt_args[:name]}-assembly-#{@sbt_args[:version]}.jar"
    @package_jar = "#{@sbt_args[:name].downcase}_#{@sbt_args[:scalaVersion].sub(/\.\d+$/, '')}-#{@sbt_args[:version]}.jar"
  end

  private
    def sbt_args
      build_sbt = @base_dir + "/build.sbt"
      cfg = {}
      open(build_sbt).each do |line|
        cfg[:name] = $1 if line =~ /^\s*name\s*:=\s*"([\w-]+)"\s*$/
        cfg[:organization] = $1 if line =~ /^\s*organization\s*:=\s*"([\w-]+(\.[\w-]+)+)"\s*$/
        cfg[:version] = $1 if line =~ /^\s*version\s*:=\s*"(\d+\.\d+(\.\d+)?(-SNAPSHOT)?)"\s*$/i
        cfg[:scalaVersion] = $1 if line =~ /^\s*scalaVersion\s*:=\s*"(\d+\.\d+\.\d+)"\s*$/
      end
      cfg
    end
end
