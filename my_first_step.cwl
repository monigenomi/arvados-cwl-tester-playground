cwlVersion: v1.2
class: CommandLineTool

requirements:
  dockerPull: ubuntu:20.01

inputs:
  message:
    type: string

  input_file:
    type: File

baseCommand: [echo]

arguments:
  - position: 1
    valueFrom: $(inputs.message)
  - position: 2
    valueFrom: ">"
  - position: 3
    valueFrom: $(inputs.input_file)
  
outputs:
  output_file:
    type: File
    outputBinding:
      glob: "$(inputs.input_file)"