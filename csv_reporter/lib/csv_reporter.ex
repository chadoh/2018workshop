defmodule CSVReporter do
  @doc """
  Converts a CSV created via Google Forms into multiple Markdown documents, one
  for each row. Makes lots of assumptions about the structure of the CSV. Used
  for generating feedback documents for the students in the Thaddeus Stevens
  CSET program for their Ruby on Rails project.

  ## Examples

      iex> CSVReporter.generate_feedback("./test/example/grades.csv")
      ["Student One.md", "Student Two.md"]
  """
  def generate_feedback(path_to_csv) do
    folder = path_to_csv
             |> Path.expand
             |> Path.dirname

    [ok: headers] = path_to_csv
                    |> Path.expand
                    |> File.stream!
                    |> CSV.decode
                    |> Enum.take(1)
    path_to_csv
    |> Path.expand
    |> File.stream!
    |> CSV.decode(headers: true)
    |> Enum.map(fn row -> make_feedback_file(row, headers, folder) end)
  end


  defp make_feedback_file({:ok, row_data}, headers, folder) do
    [student_key, _timestamp, score_key, weighted_key, letter_key | field_names] = headers
    student = row_data[student_key]
    score = row_data[score_key]
    weighted = row_data[weighted_key]
    letter = row_data[letter_key]
    content = """
    Project Feedback: #{student}
    ==================#{repeat("=", for: student)}

    raw score:    #{score}
    weighted:     #{weighted}
    letter grade: #{letter}
    #{
      field_names
      |> Enum.chunk_every(2)
      |> Enum.map(fn [rubric, notes] ->
        {rubric, row_data[rubric], row_data[notes]}
      end)
      |> Enum.map(&(feedback_for(&1)))
    }
    """

    filename = student <> ".md"
    File.write(folder <> "/" <> filename, content)
    filename
  end

  defp repeat(repeater, [for: string]) do
    String.duplicate(repeater, String.length(string))
  end

  defp feedback_for({rubric, score, notes}) do
    """


    #{rubric}
    #{repeat("-", for: rubric)}

    Your score: #{score}/4

    Notes: #{if String.length(notes) > 0, do: notes, else: "None"}
    """
  end
end
