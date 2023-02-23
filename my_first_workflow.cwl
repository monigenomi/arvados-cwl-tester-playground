cwlVersion: v1.2
class: Workflow

inputs:
  first_message:
    type: string
    default: "Hello World!"
  
  second_message:
    type: string
    default: "Hello CWL"
  
  file:
    type: File

steps:
  my_first_message:
    run: ./my_first_step.cwl
    in:
      message: first_message
      input_file: file
    out:
      - output_file

  my_second_message:
    run: "./my_first_step.cwl"
    in:
      message: second_message
      input_file: my_first_message/output_file
    out:
      -output_file
  
  outputs:
    file_with_messages:
      type: File
      outputSource: my_second_message/output_file