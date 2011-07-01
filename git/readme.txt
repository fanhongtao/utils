Design principles
1. Use a project-list-file to specify which projects will be handled.
2. The scripts should be executed in the base directory.


Usage:
Execute 'create_server_repos.sh'  on the server.

Execute on the client
    init_repos.sh
    add_remote.sh
    push_repos.sh
    pull_repos.sh

or execute 'clone_repos.sh' for clone from the server.





Server side repositories management:

The fellowing show the directories on the server.
  base
    |-- build.git
    |-- device
    |   |-- common.git 
    |   |-- google
    |   |   |-- accessory  
    |   |       |-- arduino.git
    |   |       |-- demokit.git
    |   |-- htc
    |       |-- common.git
    |-- kernel
        |-- common.git


