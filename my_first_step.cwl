cwlVersion: v1.2
class: CommandLineTool

requirements:
  DockerRequirement:
    dockerPull: alpine:latest
  ShellCommandRequirement: {}

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
    shellQuote: false
  - position: 3
    valueFrom: $(inputs.input_file.basename)
  
outputs:
  output_file:
    type: File
    outputBinding:
      glob: "$(inputs.input_file.basename)"