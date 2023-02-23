from arvados_cwl_tester import *

arvados_project_uuid("pirca-j7d0g-b05ocf2z1ak34yx")

def test_my_first_step_message_one():
    result = arvados_run(
        "./my_first_step.cwl",
        {
            "file": {
                "class": "File",
                "path": "./test/data/hello_world.txt"
            },
            "message": "Hello World!"
        }
    )
    assert "hello_world.txt" in result.files
    assert result.files["hello_world.txt"]["size"] > 0
    assert result.command == ["echo", "Hello World!", ">", "hello_world.txt"]


def test_my_first_step_message_two():
    result = arvados_run(
        "./my_first_step.cwl",
        {
            "file": {
                "class": "File",
                "path": VARIABLES["file_2"]
            },
            "message": "Hi CWL!"
        }
    )
    assert "hello_cwl.txt" in result.files
    assert result.files["hello_cwl.txt"]["size"] > 0
    assert result.command == ["echo", "Hi CWL!", ">", "hello_cwl.txt"]


def test_my_first_workflow_defaults():
    result = arvados_run(
        "./my_first_workflow.cwl",
        {
            "file": VARIABLES["file_1"]
        }
    )
    assert "hello_world.txt" in result.files



def test_my_first_workflow_provided_messages():
    result = arvados_run(
        "./my_first_workflow.cwl",
        {
            "file": VARIABLES["file_1"],
            "first_message": "I am testing workflow!",
            "second_message": "My workflow is working!"
        },
        project_uuid="pirca-j7d0g-b05ocf2z1ak34yx"
    )
    assert "hello_world.txt" in result.files

