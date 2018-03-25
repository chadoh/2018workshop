defmodule Mix.Tasks.Reports.Generate do
  use Mix.Task

  @shortdoc "Generate reports from provided CSV"
  def run([path]) do
    CSVReporter.generate_feedback(path)
  end
end

